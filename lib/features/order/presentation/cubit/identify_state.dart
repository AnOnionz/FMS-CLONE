part of 'identify_cubit.dart';

sealed class IdentifyState extends Equatable {
  const IdentifyState();

  @override
  List<Object> get props => [];
}

final class IdentifyInitial extends IdentifyState {}

final class IdentifyLoading extends IdentifyState {}

final class IdentifySuccess extends IdentifyState {
  final List<CustomerInfo> customerInfos;
  final bool isNewCustomer;

  IdentifySuccess(this.customerInfos, {required this.isNewCustomer});
}

final class IdentifyFailure extends IdentifyState {
  final Failure failure;

  IdentifyFailure(this.failure);
}
