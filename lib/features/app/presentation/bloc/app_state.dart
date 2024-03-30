part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {
  const AppInitial();
}

final class AppLoading extends AppState {
  const AppLoading();
}

final class AppSuccess extends AppState {
  final bool isLocked;

  const AppSuccess({this.isLocked = false});

  AppSuccess copyWith({bool? isLocked}) {
    return AppSuccess(
      isLocked: isLocked ?? this.isLocked,
    );
  }

  @override
  List<Object> get props => [isLocked];
}

final class AppFailure extends AppState {
  const AppFailure();
}
