import 'package:fms/core/constant/type_def.dart';
import 'package:fms/core/mixins/common.dart';
import 'package:fms/core/repository/repository.dart';
import 'package:fms/features/general/presentation/page/mixin_general.dart';
import 'package:fms/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:fms/features/profile/domain/entities/profile_status_entity.dart';
import 'package:fms/features/profile/domain/entities/user_profile_entity.dart';
import 'package:fms/features/profile/domain/repositories/profile_repository.dart';
import 'package:fms/features/statistic/domain/entities/employee_entity.dart';
import 'package:fms/features/work_place/domain/entities/outlet_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/usecase/either.dart';
import '../datasources/profile_local_datasource.dart';

class ProfileRepositoryImpl extends Repository
    with GeneralDataMixin
    implements ProfileRepository {
  final ProfileRemoteDataSource _remote;
  final ProfileLocalDataSource _local;

  ProfileRepositoryImpl(this._remote, this._local);

  @override
  Future<Result<UserProfileEntity>> createUserProfile(
      {required UserProfileEntity userProfile, required int projectId}) async {
    return todo(() async {
      await _remote.createUserProfile(
          userProfile: userProfile, projectId: projectId);
      final profile = await _remote.getUserProfile();

      return Right(profile!);
    });
  }

  @override
  Future<Result<EmployeeEntity?>> getUserInfo() async {
    return todo(() async {
      final userInfo = await _remote.getUserInfo();
      if (userInfo != null) {
        _local.clearUser();
        _local.cacheUser(userInfo);
      }

      return Right(userInfo);
    }, useInternet: true);
  }

  @override
  Future<Result<ProfileStatusEntity?>> getProfileStatus() async {
    return todo(() async {
      final profileStatus = await _remote.getProfileStatus();
      return Right(profileStatus);
    }, useInternet: true);
  }

  @override
  Future<Result<List<District>>> getDistricts({required int provinceId}) async {
    return todo(() async {
      final districts = await _remote.getDistricts(provinceId: provinceId);
      return Right(districts);
    });
  }

  @override
  Future<Result<List<Province>>> getProvinces() async {
    return todo(() async {
      final provinces = await _remote.getProvinces();
      return Right(provinces);
    });
  }

  @override
  Future<Result<List<Ward>>> getWards(
      {required int provinceId, required int districtId}) async {
    return todo(() async {
      final wards = await _remote.getWards(
          provinceId: provinceId, districtId: districtId);
      return Right(wards);
    });
  }

  @override
  Future<Result<void>> uploadFaceVerifyImage(XFile file) async {
    return todo(() async {
      await _remote.uploadFaceVerifyImage(file);
      return Right(Never);
    }, useInternet: true);
  }

  @override
  Future<Result<UserProfileEntity?>> getUserProfile() async {
    return todo(() async {
      final profile = await _remote.getUserProfile();
      return Right(profile);
    }, useInternet: true);
  }

  @override
  Future<Result<void>> markReadProfileStatus() async {
    return todo(() async {
      await _remote.markReadProfileStatus();
      return Right(Never);
    }, useInternet: true);
  }
}
