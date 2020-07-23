 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class KLLocalizations {
  final Locale locale;

  KLLocalizations(this.locale);

  static Map<String, Map<String, String>> _localized = {
    'en': {'title': "hello"},
    'zh': {'title': "你好"}
  };

  String get rTitle {
    return _localized[locale.languageCode]['title'];
  }

  static KLLocalizations of(BuildContext context) {
    return Localizations.of(context, KLLocalizations);
  }

  static  KLLocalizations local(BuildContext context) {
    return Localizations.of(context, KLLocalizations);
  }
}

class KLLocalieationDelegate extends LocalizationsDelegate<KLLocalizations> {
  KLLocalieationDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<KLLocalizations> load(Locale locale) {
    return SynchronousFuture<KLLocalizations>(KLLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<KLLocalizations> locale) {
    return false;
  }
}
