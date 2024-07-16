part of 'fetch_bank_cubit.dart';

sealed class FetchBankState extends Equatable {
  const FetchBankState();

  @override
  List<Object> get props => [];
}

final class FetchBankInitial extends FetchBankState {}

final class FetchBankLoading extends FetchBankState {}

final class FetchBankSuccess extends FetchBankState {
  final List<BankEntity> banks;

  FetchBankSuccess({required this.banks});
}

final class FetchBankFailure extends FetchBankState {
  final Failure failure;

  FetchBankFailure(this.failure);
}
