import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/general/data/repository/general_repository_impl.dart';
import 'package:fms/features/general/domain/entities/general_entity.dart';

mixin GeneralMixin<T extends StatefulWidget> on State<T> {
  GeneralEntity get general => Modular.get<GeneralRepository>().general!;
}
