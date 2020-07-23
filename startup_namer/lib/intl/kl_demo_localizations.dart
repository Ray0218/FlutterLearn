import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'kl_demo_messages_all.dart';

//  pub run intl_translation:extract_to_arb --output-dir=lib/intl lib/intl/kl_demo_localizations.dart 生成intl_message.arb

// pub run intl_translation:generate_from_arb --generated-file-prefix=kl_demo_ --output-dir=lib/intl/ lib/intl/kl_demo_localizations.dart lib/intl/intl_*.arb

class KlDemoLocalizations {
  String get title => Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],
      );

   static KlDemoLocalizations of(BuildContext context) {
  return   Localizations.of<KlDemoLocalizations>(context, KlDemoLocalizations);
  }

  static Future<KlDemoLocalizations> load(Locale local) {
    final String name =
        local.countryCode.isEmpty ? local.languageCode : local.toString();

    final String localName = Intl.canonicalizedLocale(name);

    return initializeMessages(localName).then((bool value) {
      Intl.defaultLocale = localName;

      return KlDemoLocalizations();
    });
  }
}

class KLDemoLocalieationDelegate
    extends LocalizationsDelegate<KlDemoLocalizations> {
  KLDemoLocalieationDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<KlDemoLocalizations> load(Locale locale) {
    return KlDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<KlDemoLocalizations> locale) {
    return false;
  }
}
