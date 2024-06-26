import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:fms/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:fms/features/profile/domain/usecases/get_user_info_usecase.dart';
import 'package:fms/features/profile/presentation/cubit/user_info_cubit.dart';
import 'package:fms/features/profile/presentation/pages/profile_edit_page.dart';

import '../../routes/routes.dart';
import 'data/datasources/profile_local_datasource.dart';

class ProfileModule extends Module {
  static String route = '/profile/';

  @override
  List<Module> get imports => [];

  @override
  void binds(Injector i) {
    i.addSingleton(ProfileRemoteDataSource.new);
    i.addSingleton(ProfileLocalDataSource.new);
    i.addSingleton(ProfileRepositoryImpl.new);
    i.addSingleton(GetUserInfoUsecase.new);
    i.add(UserInfoCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => ProfileEditPage());
  }
}
