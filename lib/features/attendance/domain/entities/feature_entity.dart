import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../config/domain/entities/config_entity.dart';

class FeatureEntity {
  final GeneralEntity general;
  final Feature feature;

  FeatureEntity({required this.general, required this.feature});
}
