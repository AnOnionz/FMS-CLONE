import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../general/domain/entities/config_entity.dart';

class GeneralFeatureData {
  final GeneralEntity general;
  final FeatureEntity feature;

  GeneralFeatureData({required this.general, required this.feature});
}
