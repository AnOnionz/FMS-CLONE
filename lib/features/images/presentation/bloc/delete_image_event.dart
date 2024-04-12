part of 'delete_image_bloc.dart';

sealed class DeleteImageEvent extends Equatable {
  const DeleteImageEvent();

  @override
  List<Object> get props => [];
}

class DeleteImageRequest extends DeleteImageEvent {
  final int? id;
  final String uuid;
  final GeneralEntity general;
  final FeatureEntity feature;

  DeleteImageRequest(
      {required this.id,
      required this.uuid,
      required this.general,
      required this.feature});
}
