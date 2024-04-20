import 'package:collection/collection.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';

import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/note/data/datasources/note_local_datasource.dart';

import 'package:fms/features/note/domain/entities/note_entity.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/usecase/either.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_remote_datasource.dart';

class NoteRepositoryImpl extends Repository
    with GeneralDataMixin
    implements NoteRepository {
  final NoteLocalDataSource _local;
  final NoteRemoteDataSource _remote;

  NoteRepositoryImpl(this._local, this._remote);
  @override
  Future<Result<List<NoteEntity>>> allNotes(
      {required FeatureEntity feature}) async {
    return todo(() async {
      final localPhotos = await _local.getNotesLocal();
      if (localPhotos.isNotEmpty) {
        return Right(localPhotos);
      }
      final photos = await _remote.allNotes(general: general, feature: feature);
      return Right(photos);
    });
  }

  @override
  Future<Result<void>> createNotes(
      {required List<NoteEntity> notes, required FeatureEntity feature}) async {
    return todo(
      () async {
        notes.forEach((element) {
          element.attendanceId = general.attendance!.id;
          element.featureId = feature.id;
        });

        await Future.forEach(notes, (note) async {
          if (note.status == SyncStatus.noSynced) {
            if (note.photos.isNotEmpty) {
              await Future.forEach(note.photos, (photo) async {
                if (photo.status == SyncStatus.noSynced) {
                  final report =
                      await _remote.createPhoto(photo: photo, general: general);
                  if (report != null) {
                    photo = photo.copyWith(
                        id: report.id,
                        image: report.image,
                        status: SyncStatus.synced);

                    note.photos.saveSync();
                  }
                }
              });
            }

            final report =
                await _remote.createNote(note: note, general: general);

            if (report != null) {
              note = note.copyWith(id: report.id, status: SyncStatus.synced);
              _local.cacheNoteToLocal(note);
            }
          }
        });
        return Right(Never);
      },
      onFailure: (failure) {
        _local.cacheNotesToLocal(notes);
      },
    );
  }

  @override
  Future<Result<FeatureEntity?>> getNotesNotCompleted(
      {required FeatureEntity feature}) {
    return todo(() async {
      final localNotes = await _local.getNotesLocal();
      if (localNotes.isEmpty) {
        final reportFeature = feature.copyWith(featurePhotos: []);
        return Right(reportFeature);
      }
      if (localNotes.isNotEmpty) {
        final featureMultimedias = <FeatureMultimedia>[];

        feature.featureMultimedias!.forEach((featureMultimedia) {
          final note = localNotes.firstWhereOrNull(
              (element) => element.featureMultimediaId == featureMultimedia.id);
          final bool isTextEmpty = note != null &&
              note.value == null &&
              featureMultimedia.isTextFieldRequired!;
          final bool isPhotoEmpty = note != null &&
              note.photos.length < featureMultimedia.minimumImages!;

          if (isTextEmpty || isPhotoEmpty) {
            featureMultimedias.add(featureMultimedia);
          }
        });
        if (featureMultimedias.length > 0) {
          return Right(
              feature.copyWith(featureMultimedias: featureMultimedias));
        }
      }

      return Right(null);
    });
  }

  @override
  Future<Result<List<NoteEntity>>> noSyncedData() async {
    return todo(() async {
      final localNotes = await _local.getNotesNoSynced();
      return Right(localNotes);
    });
  }

  @override
  Future<void> synchronized() async {
    final notesNoSynced = await _local.getNotesNoSynced();

    await Future.forEach(notesNoSynced, (note) async {
      final report = await _remote.createNote(note: note, general: general);
      if (report != null) {
        note = note.copyWith(id: report.id, status: SyncStatus.synced);
        _local.cacheNoteToLocal(note);
      }
    });
  }
}
