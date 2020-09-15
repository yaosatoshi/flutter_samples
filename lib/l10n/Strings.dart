import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class Strings {
  static Future<Strings> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    // ignore: strong_mode_uses_dynamic_as_bottom
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return new Strings();
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static final Strings instance = new Strings();

  // TODO ここにリソースを追加します。
  // TODO 第1引数 ... デフォルトのリソース文字列 / name : リソース名
  String get welcome => Intl.message('Welcome !!', name: "welcome");

  String get seeyou => Intl.message('See you again.', name: "seeyou");
// ..... etc.
}
