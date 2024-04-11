import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';

import 'core/utilities/bloc_obsever.dart';
import 'features/app/app_module.dart';
import 'features/app/presentation/pages/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
