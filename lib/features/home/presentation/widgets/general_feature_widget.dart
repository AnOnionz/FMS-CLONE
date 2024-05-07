import 'package:flutter/material.dart';

import '../../domain/entities/general_item_data.dart';

class GeneralFeature extends InheritedWidget {
  const GeneralFeature({
    super.key,
    required this.generalFeatureData,
    required super.child,
  });

  final GeneralFeatureData generalFeatureData;

  static GeneralFeature? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GeneralFeature>();
  }

  static GeneralFeature of(BuildContext context) {
    final GeneralFeature? result = maybeOf(context);
    assert(result != null, 'No GeneralFeature found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(GeneralFeature oldWidget) =>
      generalFeatureData != oldWidget.generalFeatureData;
}
