import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/errors/failure.dart';
import 'package:fms/features/profile/domain/usecases/mark_read_profile_status_usecase.dart';

part 'mark_read_status_state.dart';

class MarkReadStatusCubit extends Cubit<MarkReadStatusState> {
  final MarkReadProfileStatusUsecase _markReadProfileStatus;
  MarkReadStatusCubit(this._markReadProfileStatus)
      : super(MarkReadStatusInitial());

  Future<void> markRead() async {
    await _markReadProfileStatus()
      ..fold((failure) => emit(MarkReadStatusFailure(failure)),
          (data) => emit(MarkReadStatusSuccess()));
  }
}
