import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'local_delegate.dart';

/// Russian strings for the cupertino widgets.
class RussianCupertinoLocalizations implements CupertinoLocalizations {
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  const RussianCupertinoLocalizations();

  static const List<String> _shortWeekdays = <String>[
    "По.",
    "Вт.",
    "Ср.",
    "Че.",
    "Пя.",
    "Су.",
    "Во.",
  ];

  static const List<String> _shortMonths = <String>[
    'Янв.',
    'Фев.',
    'Мар.',
    'Апр.',
    'Май.',
    'Июн.',
    'Июл.',
    'Авг.',
    'Сен.',
    'Окт.',
    'Ноя.',
    'Дек.',
  ];

  static const List<String> _months = <String>[
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => hour == 1
      ? "$hour час"
      : hour > 1 && hour < 5
          ? "$hour часа"
          : "$hour чаcов";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) {
      return '1 Minute';
    }
    return '$minute Minutes';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get alertDialogLabel => 'Info';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'Stunde' : 'Stunden';

  @override
  String timerPickerMinuteLabel(int minute) => 'Min';

  @override
  String timerPickerSecondLabel(int second) => 'Sek';

  @override
  String get cutButtonLabel => 'Ausschneiden';

  @override
  String get copyButtonLabel => 'Kopieren';

  @override
  String get pasteButtonLabel => 'Einfügen';

  @override
  String get selectAllButtonLabel => 'Alles auswählen';

  /// Creates an object that provides US English resource values for the
  /// cupertino library widgets.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const RussianCupertinoLocalizations());
  }

  /// A [LocalizationsDelegate] that uses [DefaultCupertinoLocalizations.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      CupertinoLocalizationsDelegate();

  @override
  String get modalBarrierDismissLabel => "modalBarrierDismissLabel";

  @override
  String get searchTextFieldPlaceholderLabel =>
      "searchTextFieldPlaceholderLabel";

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    return "tabIndex tabCount";
  }

  @override
  List<String> get timerPickerHourLabels =>
      ["timerPickerHourLabels", "timerPickerHourLabels"];

  @override
  List<String> get timerPickerMinuteLabels =>
      ["timerPickerMinuteLabels", "timerPickerMinuteLabels"];

  @override
  List<String> get timerPickerSecondLabels =>
      ["timerPickerSecondLabels", "timerPickerSecondLabels"];

  @override
  String get todayLabel => "todayLabel";

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) => '';

  @override
  // TODO: implement clearButtonLabel
  String get clearButtonLabel => throw UnimplementedError();

  @override
  String datePickerStandaloneMonth(int monthIndex) {
    // TODO: implement datePickerStandaloneMonth
return "";
  }

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => "";

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel =>"";

  @override
  // TODO: implement noSpellCheckReplacementsLabel
  String get noSpellCheckReplacementsLabel => "";

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => "";

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => "";
}
