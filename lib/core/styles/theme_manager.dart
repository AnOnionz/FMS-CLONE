import 'package:flutter/material.dart';

import '/core/constant/keys.dart';
import '/core/database/database.dart';
import 'theme.dart';

class ThemeManager extends ChangeNotifier {
  ThemeEnum current = ThemeEnum.parse(
      Database.instance.getValue(Keys.THEME) ?? ThemeEnum.light.name);

  void changeTheme(ThemeEnum themeEnum) {
    current = themeEnum;
    notifyListeners();
    Database.instance.setValue(Keys.THEME, themeEnum.name);
  }
}
