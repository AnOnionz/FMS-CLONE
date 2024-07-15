import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fms/core/responsive/responsive.dart';
import 'package:fms/features/crawl/domain/entities/crawl_quantity_entity.dart';
import 'package:fms/features/note/domain/entities/note_entity.dart';
import 'package:fms/features/order/domain/entities/order_entity.dart';
import 'package:fms/features/report/domain/entities/photo_entity.dart';
import 'package:fms/features/sampling/domain/entities/sampling_entity.dart';

import 'core/database/database.dart';
import 'core/database/local_value.dart';
import 'features/app/app_module.dart';
import 'features/app/presentation/pages/app.dart';
import 'features/general/domain/entities/general_entity.dart';
import 'features/setting/domain/entities/setting_app.dart';
import 'features/statistic/domain/entities/employee_entity.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    OrderEntitySchema,
    EmployeeEntitySchema,
    SamplingEntitySchema
  ]);
  runApp(ModularApp(
      module: AppModule(),
      child: FlexibleBuilder(designSize: Size(430, 934), child: const App())));
}
