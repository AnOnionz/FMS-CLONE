import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/images/data/datasource/delete_image_remote_datasource.dart';
import 'package:fms/features/images/domain/repositories/delete_image_repository.dart';

import '../../../../core/usecase/either.dart';
import '../datasource/delete_image_local_remote_datasource.dart';

class DeleteImageRepositoryImpl extends Repository
    with GeneralDataMixin
    implements DeleteImageRepository {
  final DeleteImageRemoteDataSource _remote;
  final DeleteImageLocalDataSource _local;

  DeleteImageRepositoryImpl(this._remote, this._local);

  @override
  Future<Result<void>> deleteImage(
      {required FeatureEntity feature,
      required int id,
      required String uuid}) async {
    return todo(() async {
      await _remote.deleteImage(feature: feature, general: general, id: id);
      await _local.deleteLocalImage(uuid: uuid);
      return Right(Never);
    });
  }

  @override
  Future<Result<void>> deleteLocalImage({required String uuid}) async {
    return todo(() async {
      await _local.deleteLocalImage(uuid: uuid);
      return Right(Never);
    });
  }
}
