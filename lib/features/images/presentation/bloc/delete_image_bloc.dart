import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/utilities/overlay.dart';

import '../../../../core/errors/failure.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../widgets/image_view.dart';

part 'delete_image_event.dart';
part 'delete_image_state.dart';

class DeleteImageBloc extends Bloc<DeleteImageEvent, DeleteImageState> {
  DeleteImageBloc() : super(DeleteImageInitial()) {
    on<DeleteImageRequest>((event, emit) async {
      emit(DeleteImageLoading());
      OverlayManager.showLoading();
      emit(DeleteImageSuccess());
      // if (event.image.networkImage != null) {
      //   Result<void> execute;
      //   execute = await _deletePhoto(DeletePhotoParams(
      //     feature: event.feature,
      //     id: event.image.id!,
      //     uuid: event.image.uuid,
      //   ));

      //   execute.fold((failure) => emit(DeleteImageFailure(failure)),
      //       (data) => emit(DeleteImageSuccess()));
      // } else {
      //   await _deleteLocalPhoto(DeleteLocalPhotoParams(
      //       uuid: event.image.uuid, noteUuid: event.image.noteUuid));
      //   emit(DeleteImageSuccess());
      // }
    });
  }
}
