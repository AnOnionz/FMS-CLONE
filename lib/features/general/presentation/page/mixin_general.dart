import 'package:collection/collection.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/config_entity.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

mixin GeneralDataMixin {
  GeneralEntity? get general => Modular.get<GeneralRepository>().general;

  FeatureEntity? getFeature(int id) {
    return general?.config.features!
        .firstWhereOrNull((feature) => feature.id == id);
  }
}
