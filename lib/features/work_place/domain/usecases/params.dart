import 'package:fms/core/usecase/usecase.dart';
import 'package:fms/features/work_place/domain/entities/work_place_entity.dart';

class WorkPlaceParams extends Params {
  final WorkPlaceEntity enitty;

  WorkPlaceParams({required this.enitty});
}
