import 'package:equatable/equatable.dart';

import '/core/constant/type_def.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}

class Params extends Equatable {
  @override
  List<Object> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
