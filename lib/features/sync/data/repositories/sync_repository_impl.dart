import 'dart:async';

import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/crawl/data/repositories/crawl_repository_impl.dart';
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
  final CrawlRepositoryImpl _crawlRepository;

  SyncRepositoryImpl(
      this._reportRepository, this._noteRepository, this._crawlRepository);

  @override
  Future<Result<void>> synchronized(
      {required Map<FeatureEntity, List<DataEntity>> data}) async {
    return todo(
      () async {
        if (data.isNotEmpty) {
          /// get only feature has data no synced
          final map = data..removeWhere((key, value) => value.isEmpty);

          /// get synchronized of feature
          await Future.forEach(map.keys, (feature) async {
            switch (feature.type) {
              case FeatureType.photography:
                await _reportRepository.synchronized(feature);
              case FeatureType.multiSubjectMultimediaInformationCapturing:
                await _noteRepository.synchronized(feature);
              case FeatureType.multipleEntitiesQuantityCapturing:
                await _crawlRepository.synchronized(feature);
              default:
            }
          });
        }

        return Right(Never);
      },
    );
  }
}
