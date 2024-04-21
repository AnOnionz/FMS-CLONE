import 'dart:async';

import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/general/domain/entities/data_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/note/data/repositories/note_repository_impl.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';
import 'package:fms/features/sync/domain/repositories/sync_repository.dart';

import '../../../../core/constant/enum.dart';
import '../../../general/domain/entities/config_entity.dart';

class SyncRepositoryImpl extends Repository
    with GeneralDataMixin
    implements SyncRepository {
  final ReportRepositoryImpl _reportRepository;
  final NoteRepositoryImpl _noteRepository;

  SyncRepositoryImpl(this._reportRepository, this._noteRepository);

  @override
  Future<Result<void>> synchronized(
      {required Map<FeatureEntity, List<DataEntity>> data}) async {
    return todo(
      () async {
        final List<Future<void>> futures = [];

        /// get only feature has data no synced
        final map = data..removeWhere((key, value) => value.isEmpty);

        /// get synchronized of feature
        map.keys.forEach((feature) {
          switch (feature.type) {
            case FeatureType.photography:
              futures.add(_reportRepository.synchronized());
            case FeatureType.multiSubjectMultimediaInformationCapturing:
              futures.add(_noteRepository.synchronized());
            default:
          }
        });
        await Future.forEach(futures, (future) async {
          await future;
        });

        return Right(Never);
      },
      useInternet: true,
    );
  }
}
