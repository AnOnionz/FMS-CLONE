import 'package:equatable/equatable.dart';

class Wrapper<T> extends Equatable {
  final T? _value;

  Wrapper(this._value);

  bool get isNull => _value == null;

  T? get value => _value;

  @override
  List<Object?> get props => [_value];
}
