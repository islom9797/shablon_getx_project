import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/database/db_service.dart';
import '../locals/en_us.dart';
import '../locals/ko_kr.dart';
import '../locals/ru_ru.dart';
import '../locals/uz_uz.dart';
class LangService extends Translations {
  // Default locale
  static final locale = defLanguage(DBService.to.getLanguage());

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final items = ['English', "O'zbek", '한국어', 'Русский'];

  static final flags = [];

  static final langs = ['eng', 'o\'zb', '한국어', 'руc'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('uz', 'UZ'),
    const Locale('ko', 'KR'),
    const Locale('ru', 'RU'),
  ];

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'uz_UZ': uzUZ, // lang/ko_kr.dart
        'ko_KR': koKr, // lang/ko_kr.dart
        'ru_RU': ruRU, // lang/ru_ru.dart
      };

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      DBService.to.setLanguage(lang);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }

  static String defaultLanguage() {
    final locale = Get.locale;
    var lan = locale.toString();
    if (lan == "en_US") return langs[0];
    if (lan == "uz_UZ") return langs[1];
    if (lan == "ko_KR") return langs[2];
    return langs[3];
  }
}
