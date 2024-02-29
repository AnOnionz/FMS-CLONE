import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utilities/wrapper.dart';
import '/core/mixins/common.dart';

abstract class FilterItem<T> extends ChangeNotifier {
  T? defaultValue;
  late Wrapper<T> _value;
  late Wrapper<T> _temporary;

  /// 	update value straightway
  ///
  /// 	default isSync = true
  /// 	data will be saved temporarily if isSync = false
  bool isSync = true;
  bool debug;

  FilterItem({required this.defaultValue, this.debug = false}) {
    _temporary = _value = Wrapper(defaultValue);
    if (kDebugMode && debug) {
      addListener(() {
        if (isTemporarilyUpdated) {
          Fx.log('$runtimeType temporary : $value');
        } else {
          Fx.log('$runtimeType updated : $value');
        }
      });
    }
  }

  Wrapper<T> get wrapperValue => isSync ? _value : _temporary;

  T? get value => wrapperValue.value;

  bool get isTemporarilyUpdated => _temporary != _value;
  bool get canReset => _temporary != defaultValue;

  //build items
  @protected
  TransitionBuilder get builder;
  //builder filter
  Widget get child;
  //ListenableBuilder this filter
  Widget get build => ListenableBuilder(
        listenable: this,
        builder: builder,
      );

  void synchronous({required bool isEnable}) {
    isSync = isEnable;
  }

  /// apply change of temporary
  void apply() {
    _value = _temporary;
    notifyListeners();
    if (debug) {
      debugPrint('$runtimeType applied change of temporary');
    }
  }

  /// cancel all change of temporary
  void cancel() {
    _temporary = _value;
    notifyListeners();
    if (debug) {
      debugPrint('$runtimeType canceled all change of temporary');
    }
  }

  void resetToDefault() {
    if (canReset) {
      if (isSync) {
        _value = _temporary = Wrapper(defaultValue);
      } else {
        _temporary = Wrapper(defaultValue);
      }
      notifyListeners();
    }
  }

  /// dynamic set value or temporary
  void update(T valueUpdated) {
    final newValue = Wrapper(valueUpdated);
    if (_canUpdate(newValue)) {
      if (isSync) {
        _value = _temporary = newValue;
      } else {
        _temporary = newValue;
      }
      notifyListeners();
    }
  }

  bool _canUpdate(Wrapper<T> value) {
    return _temporary != value;
  }

  @override
  String toString() => '$runtimeType(value: $value)';
}
