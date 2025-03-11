 import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'korean_delegate.dart';
import 'russian_delegate.dart';
import 'uzbek_delegate.dart';

class MaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const MaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'uz', 'ko', 'ru'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(
        await DefaultMaterialLocalizations.load(const Locale('en', 'US')));
  }

  @override
  bool shouldReload(MaterialLocalizationsDelegate old) => false;
}

class CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'uz', 'ko', 'ru'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    if (locale == const Locale('uz', 'UZ')) {
      return SynchronousFuture<CupertinoLocalizations>(
          await UzbekCupertinoLocalizations.load(locale));
    }
    if (locale == const Locale('ko', 'KR')) {
      return SynchronousFuture<CupertinoLocalizations>(
          await KoreanCupertinoLocalizations.load(locale));
    }
    if (locale == const Locale('ru', 'RU')) {
      return SynchronousFuture<CupertinoLocalizations>(
          await RussianCupertinoLocalizations.load(locale));
    }
    return SynchronousFuture<CupertinoLocalizations>(
        await DefaultCupertinoLocalizations.load(locale));
  }

  @override
  bool shouldReload(CupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(en_EN)';
}
