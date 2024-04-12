import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/domain/usecases/delete_image_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../general/domain/entities/config_entity.dart';

part 'delete_image_event.dart';
part 'delete_image_state.dart';

class DeleteImageBloc extends Bloc<DeleteImageEvent, DeleteImageState> {
  final DeleteImageUseCase _deleteImage;
  DeleteImageBloc(this._deleteImage) : super(DeleteImageInitial()) {
    on<DeleteImageRequest>((event, emit) async {
      emit(DeleteImageLoading());
      OverlayManager.showLoading();
      if (event.id != null) {
        final execute = await _deleteImage(DeleteImageParams(
            general: event.general,
            feature: event.feature,
            id: event.id!,
            uuid: event.uuid));
        execute.fold((failure) => emit(DeleteImageFailure(failure)),
            (data) => emit(DeleteImageSuccess()));
      } else {
        emit(DeleteImageSuccess());
      }
    });
  }
}
