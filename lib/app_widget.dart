import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/core/constant/keys.dart';
import '/core/environment/config.dart';
import '/core/mixins/fx.dart';
import '/generated/l10n.dart';
import '/routes/routes.dart';
import 'features/authentication/domain/repositories/user_repository.dart';
import 'features/authentication/presentation/blocs/authentication_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: config.variables[Keys.APP_NAME] as String,
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
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            bloc: Modular.get<AuthenticationBloc>(),
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  context.nextAndRemoveUntilRoute(Routes.home,
                      arguments: state.user);
                case AuthenticationStatus.unauthenticated:
                  context.nextAndRemoveUntilRoute(Routes.login);
                case AuthenticationStatus.unknown:
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
