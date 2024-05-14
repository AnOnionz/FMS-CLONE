import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/order/domain/usecases/identify_customer_usecase.dart';

import '../../domain/entities/order_entity.dart';

part 'identify_state.dart';

class IdentifyCubit extends Cubit<IdentifyState> {
  final IdentifyCustomerUsecase identifyCustomer;
  IdentifyCubit(this.identifyCustomer) : super(IdentifyInitial());

  Future<void> identify(
      {required List<CustomerInfo> identifyFields,
      required int attendanceId,
      required int featureId}) async {
    emit(IdentifyLoading());
    final execute = await identifyCustomer(IdentifyCustomerParams(
        customerIdentitys: identifyFields,
        attendanceId: attendanceId,
        featureId: featureId));
    execute.fold((failure) => emit(IdentifySuccess([], isNewCustomer: true)),
        (data) => emit(IdentifySuccess(data, isNewCustomer: false)));
  }

  Future<void> setIdentify() async {
    emit(IdentifySuccess([], isNewCustomer: false));
  }
}
