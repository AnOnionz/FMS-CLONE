import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/client/dio_client.dart';
import '../core/localization/locale_manager.dart';
import '../core/permission/permisson_manager.dart';
import '../core/services/connectivity/connectivity_service.dart';
import '../core/services/location/location_service.dart';
import '../core/services/network_time/network_time_service.dart';
import '../core/styles/theme_manager.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<DioClient>(DioClient.new);
    i.addSingleton<LocationService>(LocationService.new,
        config: listenConfig());
    i.addSingleton<ThemeManager>(ThemeManager.new, config: listenConfig());
    i.addSingleton<LocaleManager>(LocaleManager.new, config: listenConfig());
    i.addSingleton<PermissionManager>(PermissionManager.new);
    i.addSingleton(ConnectivityService.new);
    i.addSingleton(NetworkTimeService.new);
  }
}

BindConfig<T> listenConfig<T extends ChangeNotifier>() {
  return BindConfig(
    notifier: (listenable) => listenable,
    onDispose: (listenable) => listenable.dispose(),
  );
}

BindConfig<T> blocConfig<T extends Bloc<dynamic, dynamic>>() {
  return BindConfig(
    notifier: (bloc) => bloc.stream,
    onDispose: (bloc) => bloc.close(),
  );
}
