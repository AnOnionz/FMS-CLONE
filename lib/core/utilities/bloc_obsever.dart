import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
}
