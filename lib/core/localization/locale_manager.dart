import 'package:flutter/material.dart';

import '/core/constant/keys.dart';
import '/core/database/database.dart';
import '/generated/l10n.dart';

class LocaleManager extends ChangeNotifier {
  static final Database database = Database();
  Locale current =
      Locale.fromSubtags(languageCode: database.getValue(Keys.LOCALE) ?? 'vi');

  void changeLocale(Locale locale) {
    if (L.delegate.isSupported(locale)) {
      current = locale;
      notifyListeners();
      database.setValue(Keys.LOCALE, locale.languageCode);
    } else {
      throw Exception('Locale not supported');
    }
  }
}
