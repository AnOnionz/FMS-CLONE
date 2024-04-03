import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fms/features/sign/sign_module.dart';
import 'package:fms/features/work_place/work_place_module.dart';

import '/core/constant/keys.dart';
import '/core/mixins/fx.dart';
import '/generated/l10n.dart';
import '../../../../core/environment/env.dart';
import '../bloc/app_bloc.dart';
import '../../../authentication/presentation/blocs/authentication_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appBloc = Modular.get<AppBloc>();

  @override
  void initState() {
    super.initState();
    appBloc.add(AppStarted());
  }

  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: env.variables[Keys.APP_NAME] as String,
        theme: context.theme,
        locale: context.locale,
        localizationsDelegates: const [
          L.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L.delegate.supportedLocales,
        routerConfig: Modular.routerConfig,
        builder: (context, child) {
          return Overlay(
            initialEntries: [
              if (child != null) ...[
                OverlayEntry(
                  builder: (context) => child,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
