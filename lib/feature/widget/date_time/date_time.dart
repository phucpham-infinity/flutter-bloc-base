import 'package:intl/intl.dart';

List months = [
  'jan',
  'feb',
  'mar',
  'apr',
  'may',
  'jun',
  'jul',
  'aug',
  'sep',
  'oct',
  'nov',
  'dec'
];

String getYearCycle({String formart = 'dd/MM/yyyy', String divider = '-'}) {
  final first = DateTime(DateTime.now().year);
  final last =
      DateTime(DateTime.now().year + 1).subtract(const Duration(days: 1));
  return '${DateFormat(formart).format(first)}$divider${DateFormat(formart).format(last)}';
}

String getDayOneYearCycle({String formart = 'dd/MM/yyyy'}) {
  final first = DateTime(DateTime.now().year);
  return '${DateFormat(formart).format(first)}}';
}

String getLastDayYearCycle({String formart = 'dd/MM/yyyy'}) {
  final last =
      DateTime(DateTime.now().year + 1).subtract(const Duration(days: 1));
  return '${DateFormat(formart).format(last)}}';
}

int toMonthNumber(String monthName) {
  return DateFormat('MMMM').parse(monthName).month;
}

extension IsAtLeastYearsOld on DateTime {
  bool isAtLeastYearsOld(int years) {
    var now = DateTime.now();
    var boundaryDate = DateTime(now.year - years, now.month, now.day);

    var thisDate = DateTime(year, month, day);

    return thisDate.compareTo(boundaryDate) <= 0;
  }
}

extension DateTimeExtension on DateTime {
  String? ddMMYYYY() {
    final DateFormat formart = DateFormat('dd/MM/yyyy');
    return formart.format(this);
  }

  String? ddMMYYYYDot() {
    final DateFormat formart = DateFormat('dd.MM.yyyy');
    return formart.format(this);
  }

  String? YYYYMMDD() {
    final DateFormat formart = DateFormat('yyyy-MM-dd');
    return formart.format(this);
  }

  String? MMddYYYY() {
    final DateFormat formart = DateFormat('yMMMMd');
    return formart.format(this).replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  bool isAM() {
    final DateFormat formatter = DateFormat('h:mm a');
    final String formatted = formatter.format(this);
    return formatted.contains('AM');
  }

  bool isPM() {
    final DateFormat formatter = DateFormat('h:mm a');
    final String formatted = formatter.format(this);
    return formatted.contains('PM');
  }

  bool isSameDateAs(DateTime date) {
    return this.day == date.day &&
        this.month == date.month &&
        this.year == date.year;
  }

  String toDateString() {
    DateFormat formatter = new DateFormat('MMM-dd-yyyy');
    String formattedTime =
        DateFormat('h:mm a').format(DateTime.parse(this.toString()));
    final String formatted = formatter.format(this);
    return formatted + ' at ' + formattedTime;
  }

  String toAWSDateTime() {
    final DateFormat formart = DateFormat('yyyy-MM-dd hh:mm:ss');
    return formart.format(this);
  }

  DateTime switchAMPM() {
    if (this.hour > 12)
      return this.subtract(const Duration(hours: 12));
    else
      return this.add(const Duration(hours: 12));
  }
}

class MmsShortEn {
  String justNow() => 'just now';
  String prefixAgo() => '';
  String prefixFromNow() => 'in';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => '${seconds}s';
  String aboutAMinute() => '1m';
  String minutes(int minutes) => '${minutes}m';
  String aboutAnHour() => '1h';
  String hours(int hours) => '${hours}h';
  String aDay() => '1d';
  String days(int days) => '${days}d';
  String aboutAMonth(int days) => '1mo';
  String months(int months) => '${months}mos';
  String aboutAYear() => '1yr';
  String years(int years) => '${years}yrs';
  String wordSeparator() => ' ';
  String empty() => '';
}

String timestampToDateString(int? timestamp) {
  if (timestamp == null) return '';
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}

String? getDayLeft(String? startDate, String? endDate) {
  if (startDate == null ||
      endDate == null ||
      startDate == '' ||
      endDate == '') {
    return null;
  } else {
    var format = DateFormat("dd/MM/yyyy");
    DateTime dateTimeStart = format.parse(startDate);
    DateTime dateTimeEnd = format.parse(endDate);
    print(dateTimeStart);
    var difference = dateTimeEnd.difference(dateTimeStart);

    return difference.inDays.toString();
  }
}

int ddMMMYYYYtoTimeStamp(String str) {
  if (str.length != 11) return 0;
  final year = int.tryParse(str.substring(6)) ?? 0;
  final month = months.indexOf(str.substring(3, 6).toLowerCase()) + 1;
  final day = int.tryParse(str.substring(0, 2)) ?? 0;
  final time = DateTime(year, month, day);
  return (time.millisecondsSinceEpoch / 1000).ceil();
}

String timestampToDateTimeString(int? timestamp) {
  if (timestamp == null || timestamp == 0) return '';
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final DateFormat formatter = DateFormat('dd MMM yyyy h:mm a');
  final String formatted = formatter.format(date);
  return formatted;
}

String timestampToTimeString(int? timestamp) {
  if (timestamp == null) return '';
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  final DateFormat formatter = DateFormat('h:mm a');
  final String formatted = formatter.format(date);
  return formatted;
}

DateTime? timestampToDate(int? timestamp) {
  if (timestamp == null) return null;
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return date;
}

extension DateTimeValidator on DateTime? {
  String timeAgoEnShort() {
    if (this == null) return '';
    final messages = MmsShortEn();

    DateTime dateTimeNow = DateTime.now();
    final elapsed = dateTimeNow.difference(this!).inMilliseconds;

    if (elapsed == 0) {
      return messages.empty();
    }

    String prefix, suffix;

    prefix = messages.prefixAgo();
    suffix = messages.suffixAgo();

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    String result;
    if (seconds == 0) {
      result = messages.justNow();
    } else if (seconds < 45) {
      result = messages.lessThanOneMinute(seconds.round());
    } else if (seconds < 90) {
      result = messages.aboutAMinute();
    } else if (minutes < 45) {
      result = messages.minutes(minutes.round());
    } else if (minutes < 90) {
      result = messages.aboutAnHour();
    } else if (hours < 24) {
      result = messages.hours(hours.round());
    } else if (hours < 48) {
      result = messages.aDay();
    } else if (days < 30) {
      result = messages.days(days.round());
    } else if (days < 60) {
      result = messages.aboutAMonth(days.round());
    } else if (days < 365) {
      result = messages.months(months.round());
    } else if (years < 2) {
      result = messages.aboutAYear();
    } else {
      result = messages.years(years.round());
    }

    return [prefix, result, suffix]
        .where((str) => str.isNotEmpty)
        .join(messages.wordSeparator());
  }
}
