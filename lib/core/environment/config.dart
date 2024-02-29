import 'package:flutter_flavor/flutter_flavor.dart';

import '/core/constant/keys.dart';

FlavorConfig get config => FlavorConfig.instance;

const _appName = String.fromEnvironment(Keys.APP_NAME);
const _env = String.fromEnvironment(Keys.ENV);
const _baseURL = String.fromEnvironment(Keys.BASE_URL);

class AppConfig {
  static Map<String, String> variables = {
    Keys.APP_NAME: _appName,
    Keys.BASE_URL: _baseURL,
  };

  static FlavorConfig initialFlavor() {
    return FlavorConfig(name: _env, variables: variables);
  }
}
