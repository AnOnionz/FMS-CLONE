import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/profile/domain/usecases/get_wards_usecase.dart';

import '../../../work_place/domain/entities/outlet_entity.dart';

part 'fetch_ward_state.dart';

class FetchWardCubit extends Cubit<FetchWardState> {
  final GetWardsUsecase _getWards;
  FetchWardCubit(this._getWards) : super(FetchWardInitial());

  Future<void> fetchWards(
      {required int provinceId, required int districtId}) async {
    emit(FetchWardLoading());
    await _getWards(
        GetWardsParams(provinceId: provinceId, districtId: districtId))
      ..fold((failure) => emit(FetchWardFailure()),
          (data) => emit(FetchWardSuccess(data)));
  }
}
