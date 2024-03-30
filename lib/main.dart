import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/database/file_metadata.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/authentication/data/models/user_model.dart';
import 'package:fms/features/setting/domain/entities/setting_app.dart';
import '/app_widget.dart';
import '/core/database/database.dart';
import '/core/environment/config.dart';
import '/routes/app_module.dart';
import 'core/database/local_value.dart';
import 'core/utilities/bloc_obsever.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialFlavor();
  await dotenv.load(fileName: '.env/.env');
  await Database.open([
    LocalValueSchema,
    UserModelSchema,
    SettingAppSchema,
    FileWithMetaDataSchema
  ]);
  Bloc.observer = SimpleBlocObserver();

  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
