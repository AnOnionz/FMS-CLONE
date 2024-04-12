part of 'delete_image_bloc.dart';

sealed class DeleteImageState extends Equatable {
  const DeleteImageState();

  @override
  List<Object> get props => [];
}

final class DeleteImageInitial extends DeleteImageState {}

final class DeleteImageLoading extends DeleteImageState {}

final class DeleteImageSuccess extends DeleteImageState {}

final class DeleteImageFailure extends DeleteImageState {
  final Failure failure;

  DeleteImageFailure(this.failure);
}
