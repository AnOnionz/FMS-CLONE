import 'package:fms/features/general/domain/entities/general_entity.dart';

import '../../../general/domain/entities/config_entity.dart';

class GeneralItemData {
  final GeneralEntity general;
  final FeatureEntity feature;

  GeneralItemData({required this.general, required this.feature});
}
