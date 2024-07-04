import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fms/features/profile/domain/usecases/upload_face_verify_image_usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/failure.dart';

part 'upload_face_state.dart';

class UploadFaceCubit extends Cubit<UploadFaceState> {
  final UploadFaceVerifyImageUsecase _uploadFaceVerifyImage;
  UploadFaceCubit(this._uploadFaceVerifyImage) : super(UploadFaceInitial());

  Future<void> upload(XFile image) async {
    emit(UploadFaceLoading());
    await _uploadFaceVerifyImage(image)
      ..fold((failure) => emit(UploadFaceFailure(failure)),
          (data) => emit(UploadFaceSuccess()));
  }
}
