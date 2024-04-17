import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import 'core/database/database.dart';
import 'core/database/file_metadata.dart';
import 'core/database/local_value.dart';
import 'features/app/app_module.dart';
import 'features/app/presentation/pages/app.dart';
import 'features/authentication/data/models/user_model.dart';
import 'features/general/domain/entities/general_entity.dart';
import 'features/setting/domain/entities/setting_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.open([
    LocalValueSchema,
    UserModelSchema,
    SettingAppSchema,
    FileWithMetaDataSchema,
    GeneralEntitySchema,
    PhotoEntitySchema,
    CrwalQuantityEntitySchema
  ]);
  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
