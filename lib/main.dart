import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';

import 'core/database/database.dart';
import 'core/database/local_value.dart';
import 'features/app/app_module.dart';
import 'features/app/presentation/pages/app.dart';
import 'features/general/domain/entities/general_entity.dart';
import 'features/setting/domain/entities/setting_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Database.open([
    LocalValueSchema,
    SettingAppSchema,
    GeneralEntitySchema,
    PhotoEntitySchema,
    NoteEntitySchema,
    CrawlQuantityEntitySchema,
    OrderEntitySchema
  ]);
  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
