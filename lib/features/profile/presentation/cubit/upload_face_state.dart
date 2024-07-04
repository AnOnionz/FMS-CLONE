part of 'upload_face_cubit.dart';

sealed class UploadFaceState extends Equatable {
  const UploadFaceState();

  @override
  List<Object> get props => [];
}

final class UploadFaceInitial extends UploadFaceState {}

final class UploadFaceLoading extends UploadFaceState {}

final class UploadFaceSuccess extends UploadFaceState {}

final class UploadFaceFailure extends UploadFaceState {
  final Failure failure;

  UploadFaceFailure(this.failure);
}
