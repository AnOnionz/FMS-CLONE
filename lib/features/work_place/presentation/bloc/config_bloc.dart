import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';
import 'package:fms/features/work_place/domain/usecases/get_config_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/usecases/params.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUsecase getConfig;
  ConfigBloc({required this.getConfig}) : super(ConfigInitial()) {
    on<FetchConfig>((event, emit) async {
      emit(ConfigLoading());
      final execute = await getConfig(WorkPlaceParams(enitty: event.workPlace));
      execute.fold(
          (fail) => emit(ConfigFailure(fail)), (success) => ConfigSuccess());
    });
  }
}
