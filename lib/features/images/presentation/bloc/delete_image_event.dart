part of 'delete_image_bloc.dart';

sealed class DeleteImageEvent extends Equatable {
  const DeleteImageEvent();

  @override
  List<Object> get props => [];
}

class DeleteImageRequest extends DeleteImageEvent {
  final ImageDynamic image;

  final FeatureEntity feature;

  DeleteImageRequest({required this.image, required this.feature});
}
