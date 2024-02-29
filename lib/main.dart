import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import '/app_widget.dart';
import '/core/database/database.dart';
import '/core/environment/config.dart';
import '/routes/app_module.dart';
import 'core/database/local_value.dart';
import 'core/utilities/bloc_obsever.dart';
import 'features/authentication/domain/entities/user_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  AppConfig.initialFlavor();
  await Database.open([
    LocalValueSchema,
    UserEntitySchema,
  ]);
  Bloc.observer = SimpleBlocObserver();
  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
