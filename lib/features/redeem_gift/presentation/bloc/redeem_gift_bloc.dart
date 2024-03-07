import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'redeem_gift_event.dart';
part 'redeem_gift_state.dart';

class RedeemGiftBloc extends Bloc<RedeemGiftEvent, RedeemGiftState> {
  RedeemGiftBloc() : super(RedeemGiftInitial()) {
    on<RedeemGiftEvent>((event, emit) {});
  }
}
