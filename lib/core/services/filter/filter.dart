import 'package:flutter/material.dart';

import '/core/mixins/common.dart';
import '/core/services/filter/filter_item.dart';

export '../filter/filter_item.dart';
export '../filter/filter_value.dart';

class Filter extends ChangeNotifier {
  final List<FilterItem<dynamic>> filters;

  Filter({required this.filters}) {
    for (final filter in filters) {
      filter.addListener(_listener);
    }

    addListener(() {
      Fx.log('$runtimeType updated : $filters');
    });
  }

  void _listener() {
    notifyListeners();
  }

  void aplly() {
    bool isChanged = false;
    for (final filter in filters) {
      if (filter.isTemporarilyUpdated) {
        isChanged = true;
        filter.apply();
      }
    }
    if (isChanged) notifyListeners();
  }

  void cancel() {
    for (final filter in filters) {
      filter.cancel();
    }
  }

  /// change synchronous
  ///
  /// if [true] update value straightway
  void setSynchronous(bool isEnable) {
    for (final filter in filters) {
      filter.synchronous(isEnable: isEnable);
      if (isEnable) {
        filter.addListener(_listener);
      }
      if (!isEnable) {
        filter.removeListener(_listener);
      }
    }
  }

  void reset() {
    for (final filter in filters) {
      filter.resetToDefault();
    }
  }

  @override
  String toString() => '$runtimeType(filters: $filters)';
}
