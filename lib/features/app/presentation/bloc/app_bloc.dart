import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/home/home_module.dart';
import 'package:fms/features/sign/sign_module.dart';
import 'package:fms/features/sync/presentation/bloc/sync_bloc.dart';
import 'package:fms/features/work_place/work_place_module.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constant/enum.dart';
import '../../../../core/mixins/common.dart';
import '../../../../core/services/connectivity/connectivity_service.dart';
import '../../../../core/services/network_time/network_time_service.dart';
import '../../../authentication/presentation/blocs/authentication_bloc.dart';
import '../../../sync/presentation/bloc/sync_progress_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationBloc _authenticationBloc;
  final ConnectivityService _connectivityService;
  final NetworkTimeService _networkTimeService;
  final GeneralRepository _generalRepository;
  final SyncBloc _syncBloc;
  final SyncProgressBloc _syncProgressBloc;
  final _authenticationBehaviorSubject = BehaviorSubject<AuthenticationState>();

  StreamSubscription<AuthenticationState>? _authenticationSubscription;
  StreamSubscription<SyncState>? _syncSubscription;
  Timer? _timer;

  AppBloc(
    this._authenticationBloc,
    this._connectivityService,
    this._generalRepository,
    this._networkTimeService,
    this._syncBloc,
    this._syncProgressBloc,
  ) : super(const AppInitial()) {
    _authenticationBehaviorSubject.addStream(_authenticationBloc.stream);

    on<AppStarted>(_onAppStarted);
    on<AppLocked>(_onAppLocked);
    on<AppUnlocked>(_onAppUnlocked);
    on<AppLifecycleChanged>(_onAppLifeCycleChanged);
    on<AppAuthenticationSubscribed>(_onAppAuthenticationSubscribed);
    on<AppAuthenticationUnsubscribed>(_onAppAuthenticationUnsubscribed);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  @override
  void onChange(Change<AppState> change) {
    super.onChange(change);
    final nextState = change.nextState;
    if (nextState is AppSuccess) {
      // _checkLockStatus(nextState);
    }
  }

  Future<void> _checkAuthenticationStatus(AuthenticationStatus status) async {
    if (status == AuthenticationStatus.authenticated) {
      await _generalRepository.getLocalGeneral()
        ..fold((failure) => Modular.to.navigate(WorkPlaceModule.route), (data) {
          if (data != null) {
            _syncBloc.add(SyncStarted());
            _syncBloc.add(SyncAddListener());
            Modular.to.pushNamedAndRemoveUntil(HomeModule.route, (p0) => false);
          } else {
            Modular.to.navigate(WorkPlaceModule.route);
          }
        });
    } else if (status == AuthenticationStatus.unauthenticated) {
      await _generalRepository.clearGeneral();
      Modular.to.navigate(SignModule.route);
    }
  }

  /// Starts the network time service.

  void _startNetworkTimeService() {
    return _networkTimeService.startup();
  }

  /// Starts the internet connection service.

  Future<void> _startInternetConnectionService() async {
    return _connectivityService.startup(
      timeout: const Duration(seconds: 10),
      interval: const Duration(seconds: 10),
    );
  }

  /// Callback function when an [AppStarted] event is emitted.
  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(const AppLoading());
    _startInternetConnectionService();
    _startNetworkTimeService();

    _syncSubscription = _syncBloc.stream.listen((syncState) async {
      if (syncState.status == SyncStatus.isNoSynced) {
        _timer?.cancel();
        _timer = Timer(Duration(seconds: 120), () {
          _syncProgressBloc.add(SyncProgressSilent());
        });
      } else {
        _timer?.cancel();
      }
    });

    _connectivityService.onConnectionChange.listen((status) async {
      Fx.log('Internet status: $status');
      if (status == InternetStatus.connected) {
      } else {
        if (OverlayManager.currentContext != null) {
          OverlayManager.showToast(
              msg: 'Không có kết nối internet',
              context: OverlayManager.currentContext!);
        }
      }
    });

    _authenticationBloc.add(AuthenticationStarted());
    // _settingsBloc.add(const SettingsStarted());

    final results = await Future.wait([
      _authenticationBloc.stream.first,
      // _settingsBloc.stream.first,
    ]);

    final authState = results[0];
    // final settingsState = results[1] as SettingsState;

    // if (settingsState is SettingsFailure) {
    //   final settings = Settings(
    //     appearance: SettingsAppearance(),
    //     security: SettingsSecurity()
    //       ..autoLock = AutoLockType.immediately
    //       ..enableBiometrics = true
    //       ..enablePasscode = true
    //       ..passcodeDigits = 4,
    //     storage: SettingsStorage(),
    //   );
    //   _settingsBloc.add(SettingsUpdated(settings));
    // }

    // if (settingsState is SettingsSuccess) {
    //   print(settingsState.settings.isarId.toInt());
    // }

    // print(settingsState);

    final isAuthenticated =
        authState.status == AuthenticationStatus.authenticated;

    emit(AppSuccess(isLocked: isAuthenticated));
  }

  /// Callback function when an [AppLocked] event is emitted.
  ///
  /// The function updates the state of the app to set `isLocked` to `true` if the current state is [AppSuccess].
  void _onAppLocked(AppLocked event, Emitter<AppState> emit) {
    final currentState = state;
    if (currentState is AppSuccess) {
      emit(currentState.copyWith(isLocked: true));
    }
  }

  /// Callback function when an [AppUnlocked] event is emitted.
  ///
  /// The function updates the state of the app to set `isLocked` to `false` if the current state is [AppSuccess].
  void _onAppUnlocked(AppUnlocked event, Emitter<AppState> emit) {
    final currentState = state;
    if (currentState is AppSuccess) {
      emit(currentState.copyWith(isLocked: false));
    }
  }

  /// Callback function when an [AppLifecycleChanged] event is emitted.
  ///
  /// This function is called when the lifecycle state of the app changes.
  /// It checks if the app has resumed and triggers the [AuthenticationStarted] event in the [AuthenticationBloc].
  /// It also refreshes the network time if it is currently running.
  void _onAppLifeCycleChanged(
    AppLifecycleChanged event,
    Emitter<AppState> emit,
  ) {
    if (event.state == AppLifecycleState.resumed) {
      // Trigger the AuthenticationStarted event in the AuthenticationBloc
      _authenticationBloc.add(AuthenticationStarted());

      // Check if the network time is running and refresh it if necessary
      // if (_networkTimeService.isRunning) {
      //   _networkTimeService.runner.refresh();
      // }
    }
  }

  /// Callback function when an [AppAuthenticationSubscribed] event is emitted.
  ///
  /// Subscribes to the [_authenticationBehaviorSubject] stream and listens for changes in authentication state.
  void _onAppAuthenticationSubscribed(
    AppAuthenticationSubscribed event,
    Emitter<AppState> emit,
  ) {
    _authenticationSubscription = _authenticationBehaviorSubject.stream
        .distinct()
        .listen((authState) async {
      await _checkAuthenticationStatus(authState.status);
    });
  }

  /// Callback function for when an [AppAuthenticationUnsubscribed] event is emitted.
  ///
  /// It cancels the authentication subscription and sets it to null.
  void _onAppAuthenticationUnsubscribed(
    AppAuthenticationUnsubscribed event,
    Emitter<AppState> emit,
  ) {
    _authenticationSubscription?.cancel();
    _authenticationSubscription = null;
  }

  @override
  Future<void> close() async {
    await _authenticationSubscription?.cancel();
    await _authenticationBloc.close();
    await _syncSubscription?.cancel();
    return super.close();
  }
}
