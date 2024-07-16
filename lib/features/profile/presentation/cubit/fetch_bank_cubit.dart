import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/profile/domain/usecases/get_banks_usecase.dart';

import '../../domain/entities/bank_entity.dart';

part 'fetch_bank_state.dart';

class FetchBankCubit extends Cubit<FetchBankState> {
  final GetBanksUsecase _getBanks;
  FetchBankCubit(this._getBanks) : super(FetchBankInitial());

  Future<void> fetchBanks() async {
    emit(FetchBankLoading());
    await _getBanks()
      ..fold((failure) => emit(FetchBankFailure(failure)),
          (data) => emit(FetchBankSuccess(banks: data)));
  }
}
