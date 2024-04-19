import 'dart:async';

import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/core/usecase/either.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/report/data/repositories/report_repository_impl.dart';
import 'package:fms/features/sync/domain/repositories/sync_repository.dart';

import '../../../../core/constant/enum.dart';

class SyncRepositoryImpl extends Repository
    with GeneralDataMixin
    implements SyncRepository {
  final ReportRepositoryImpl _reportRepository;

  SyncRepositoryImpl(this._reportRepository);

  @override
  Future<Result<void>> synchronized(
      {required Map<FeatureType, List<dynamic>> data}) async {
    return todo(
      () async {
        final List<Future<void>> futures = [];

        /// get only feature has data no synced
        final map = data..removeWhere((key, value) => value.isEmpty);

        /// get synchronized of feature
        map.keys.forEach((element) {
          switch (element) {
            case FeatureType.photography:
              futures.add(_reportRepository.synchronized());
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
