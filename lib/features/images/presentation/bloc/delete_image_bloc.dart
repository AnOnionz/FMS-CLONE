import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/core/utilities/overlay.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';
import 'package:fms/features/images/domain/usecases/delete_image_usecase.dart';
import 'package:fms/features/report/domain/entities/report_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/image_picker_widget.dart';
import '../../../general/domain/entities/config_entity.dart';
import '../../domain/usecases/delete_local_image_usecase.dart';

part 'delete_image_event.dart';
part 'delete_image_state.dart';

class DeleteImageBloc extends Bloc<DeleteImageEvent, DeleteImageState> {
  final DeleteImageUseCase _deleteImage;
  final DeleteLocalImageUseCase _deleteLocalImage;
  DeleteImageBloc(this._deleteImage, this._deleteLocalImage)
      : super(DeleteImageInitial()) {
    on<DeleteImageRequest>((event, emit) async {
      emit(DeleteImageLoading());
      OverlayManager.showLoading();
      if (event.image.networkImage != null) {
        final execute = await _deleteImage(DeleteImageParams(
            general: event.general,
            feature: event.feature,
            id: event.image.id!,
            uuid: event.image.uuid));
        execute.fold((failure) async => emit(DeleteImageFailure(failure)),
            (data) async => emit(DeleteImageSuccess()));
      } else {
        await _deleteLocalImage(event.image.uuid);
        emit(DeleteImageSuccess());
      }
    });
  }
}
