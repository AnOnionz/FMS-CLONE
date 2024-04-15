part of 'delete_image_bloc.dart';

sealed class DeleteImageEvent extends Equatable {
  const DeleteImageEvent();

  @override
  List<Object> get props => [];
}

class DeleteImageRequest extends DeleteImageEvent {
  final ImageDynamic image;
  final GeneralEntity general;
  final FeatureEntity feature;

  DeleteImageRequest(
      {required this.image, required this.general, required this.feature});
}
