import 'package:collection/collection.dart';
import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/data_source/local_data_source.dart';
import 'package:fms/core/repository/repository.dart';

import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/images/data/datasource/delete_image_local_remote_datasource.dart';
import 'package:fms/features/images/data/datasource/delete_image_remote_datasource.dart';
import 'package:fms/features/note/data/datasources/note_local_datasource.dart';

import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/usecase/either.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_remote_datasource.dart';

class NoteRepositoryImpl extends Repository
    with GeneralDataMixin, LocalDatasource
    implements NoteRepository {
  final NoteLocalDataSource _local;
  final NoteRemoteDataSource _remote;
  final DeletePhotoRemoteDataSource _remotePhoto;
  final DeletePhotoLocalDataSource _localPhoto;

  NoteRepositoryImpl(
      this._local, this._remote, this._remotePhoto, this._localPhoto);
  @override
  Future<Result<(List<NoteEntity> notes, List<PhotoEntity> photos)>> allNotes(
      {required FeatureEntity feature}) async {
    return todo(() async {
      List<NoteEntity> notes;
      List<PhotoEntity> photos;

      notes = await _local.getNotesByFeature(feature);

      if (notes.isNotEmpty) {
        photos = notes
            .map((note) => note.photos)
            .expand((element) => element)
            .toList();
        return Right((notes, photos));
      }
      notes = await _remote.allNotes(general: general, feature: feature);
      photos = await _remote.allPhotos(general: general, feature: feature);

      return Right((notes, photos));
    });
  }

  @override
  Future<Result<void>> createNotes(
      {required List<NoteEntity> notes,
      required List<PhotoEntity> photos,
      required FeatureEntity feature}) async {
    return todo(
      () async {
        photos.forEach((photo) {
          _local.cachePhotoToLocal(photo);
        });

        notes.forEach((note) async {
          final photosOfNote = photos.where(
              (photo) => photo.featurePhotoId == note.featureMultimediaId);

          note.photos.addAll(photosOfNote);
          _local.cacheNoteToLocal(note);
          db.writeTxnSync(() => note.photos.saveSync());
        });
        await _uploadNotes(notes: notes, feature: feature);

        return Right(Never);
      },
    );
  }

  @override
  Future<Result<FeatureEntity?>> getNotesNotCompleted(
      {required FeatureEntity feature}) {
    return todo(() async {
      final localNotes = await _local.getNotesByFeature(feature);
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
              note.photos
                      .where(
                          (element) => element.status != SyncStatus.isDeleted)
                      .length <
                  featureMultimedia.minimumImages!;

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
  Future<Result<Map<int, List<NoteEntity>>>> noSyncedData() async {
    return todo(() async {
      final localPhotos = await _local.getNotes();

      final map = localPhotos.groupListsBy((element) => element.featureId!);
      map.entries.forEach(
        (element) {
          element.value
              .removeWhere((element) => element.status == SyncStatus.synced);
        },
      );
      return Right(map);
    });
  }

  @override
  Future<void> synchronized(FeatureEntity feature) async {
    final notesNoSynced = await _local.getNotesNoSynced(feature);

    await _uploadNotes(notes: notesNoSynced, feature: feature);
  }

  Future<void> _uploadNotes(
      {required List<NoteEntity> notes, required FeatureEntity feature}) async {
    await Future.forEach(notes, (note) async {
      if (note.status == SyncStatus.isNoSynced) {
        if (note.photos.isNotEmpty) {
          await Future.forEach(note.photos, (photo) async {
            if (photo.status == SyncStatus.isDeleted) {
              if (photo.id != null) {
                await _remotePhoto.deleteNotePhoto(
                    general: general, feature: feature, id: photo.id!);
              }
              _localPhoto.deleteLocalPhoto(uuid: photo.dataUuid);
            }
            if (photo.status == SyncStatus.isNoSynced) {
              final resp = await _remote.createPhoto(
                  photo: photo, general: general, feature: feature);
              if (resp != null) {
                photo = photo.copyWith(
                    id: resp.id, image: resp.image, status: SyncStatus.synced);
                _local.cachePhotoToLocal(photo);
              }
            }
          });
        }

        final report = await _remote.createNote(note: note, general: general);
        if (report != null) {
          note = note.copyWith(id: report.id, status: SyncStatus.synced);
          _local.cacheNoteToLocal(note);
        }
      }
    });
  }
}
