import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/profile/domain/usecases/get_districts_usecase.dart';

import '../../../work_place/domain/entities/outlet_entity.dart';

part 'fetch_district_state.dart';

class FetchDistrictCubit extends Cubit<FetchDistrictState> {
  final GetDistrictsUsecase _getDistricts;
  FetchDistrictCubit(this._getDistricts) : super(FetchDistrictInitial());

  Future<void> fetchDistricts({required int provinceId}) async {
    emit(FetchDistrictLoading());
    await _getDistricts(provinceId)
      ..fold((failure) => emit(FetchDistrictFailure()),
          (data) => emit(FetchDistrictSuccess(data)));
  }
}
