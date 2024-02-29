// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FilterValue<T> extends Equatable {
  final T? v;

  FilterValue(this.v);

  @override
  String toString() => 'FilterValue(v: $v)';

  @override
  List<Object?> get props => [v];
}
