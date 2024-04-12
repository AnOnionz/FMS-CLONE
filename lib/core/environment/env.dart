import 'package:flutter_flavor/flutter_flavor.dart';

import '/core/constant/keys.dart';

FlavorConfig get env => FlavorConfig.instance;

class AppConfig {
  static const _appName = String.fromEnvironment(Keys.APP_NAME);
  static const _env = String.fromEnvironment(Keys.ENV);
  static const _baseURL = String.fromEnvironment(Keys.BASE_URL);
  static const _authDomain = String.fromEnvironment(Keys.AUTH0_DOMAIN);
  static const _authScheme = String.fromEnvironment(Keys.AUTH0_CUSTOM_SCHEME);
  static const _authClientId = String.fromEnvironment(Keys.AUTH0_CLIENT_ID);
  Map<String, String> variables = {
    Keys.APP_NAME: _appName,
    Keys.BASE_URL: _baseURL,
    Keys.AUTH0_CLIENT_ID: _authClientId,
    Keys.AUTH0_CUSTOM_SCHEME: _authScheme,
    Keys.AUTH0_DOMAIN: _authDomain
  };

  AppConfig() {
    FlavorConfig(name: _env, variables: variables);
  }
}
