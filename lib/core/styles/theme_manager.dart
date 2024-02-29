import 'package:flutter/material.dart';

import '/core/constant/keys.dart';
import '/core/database/database.dart';
import 'theme.dart';

class ThemeManager extends ChangeNotifier {
  static final Database database = Database();
  ThemeEnum current =
      ThemeEnum.parse(database.getValue(Keys.THEME) ?? ThemeEnum.light.name);

  void changeTheme(ThemeEnum themeEnum) {
    current = themeEnum;
    notifyListeners();
    database.setValue(Keys.THEME, themeEnum.name);
  }
}
