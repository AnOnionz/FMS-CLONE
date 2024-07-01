import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../work_place/domain/entities/outlet_entity.dart';
import '../../domain/usecases/get_provinces_usecase.dart';

part 'fetch_province_state.dart';

class FetchProvinceCubit extends Cubit<FetchProvinceState> {
  final GetProvincesUsecase _getProvinces;
  FetchProvinceCubit(this._getProvinces) : super(FetchProvinceInitial());

  Future<void> fetchProvinces() async {
    emit(FetchProvinceLoading());
    await _getProvinces()
      ..fold((failure) => emit(FetchProvinceFailure()),
          (data) => emit(FetchProvinceSuccess(data)));
  }
}
