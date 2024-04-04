import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/core_module.dart';
import 'data/datasources/local_data_source.dart';
import 'data/datasources/remote_data_source.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/usecases/change_pass_usecase.dart';
import 'domain/usecases/get_credentials_usecase.dart';
import 'domain/usecases/has_valid_credentials_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/logout_usecase.dart';
import 'presentation/blocs/authentication_bloc.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<AuthenticationLocalDataSource>(UserLocalDataSourceImpl.new);
    i.add<AuthenticationRemoteDataSource>(UserRemoteDataSourceImpl.new);
    i.addSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl.new);
    i.addLazySingleton<LoginUsecase>(LoginUsecase.new);
    i.addLazySingleton<LogoutUsecase>(LogoutUsecase.new);
    i.addLazySingleton<ChangePassUsecase>(ChangePassUsecase.new);
    i.addLazySingleton(HasValidCredentialsUsecase.new);
    i.addLazySingleton(GetCredentialsUsecase.new);
    i.addLazySingleton<AuthenticationBloc>(AuthenticationBloc.new);
  }
}
