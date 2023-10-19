import 'package:intl/intl.dart';

import '../../data/repository/app_session.dart';

class CustomDateUtils {
  static String formatDate(String date) {
    if (date.isEmpty) {
      return "";
    }

    String day = DateFormat("dd").format(DateTime.parse(date));
    String month = DateFormat("MMMM", AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    String year = DateFormat("yyyy").format(DateTime.parse(date).toLocal());
    return "$day $month $year";
  }

  // normal format mean 20-01-2023
  static String normalFormat(String date) {
    if (date.isEmpty) {
      return "";
    }
    String day = DateFormat("dd", AppSession.getLangKey()).format(DateTime.parse(date));
    String month = DateFormat("MM", AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    String year = DateFormat("yyyy", AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    return "$day/$month/$year";
  }

  static String formatTime(String date) {
    String time = DateFormat("hh:mma").format(DateTime.parse(date).toLocal());
    return " $time";
  }

  // time from am and pm
  static String timeToAmOrPm(String time, {bool fromSelectDate = false}) {
    String finalTime = time;
    if (time.isEmpty) {
      return "";
    }

    if (fromSelectDate) {
      finalTime = "$finalTime:00";
    }

    return DateFormat("h:mm a", AppSession.getLangKey()).format(
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateFormat("HH:mm:ss").parse(finalTime).hour,
              DateFormat("HH:mm:ss").parse(finalTime).minute, DateFormat("HH:mm:ss").parse(finalTime).second).toLocal().add(Duration(minutes: DateTime.now().timeZoneOffset.inMinutes)),
    );
  }

  static DateTime dateTimeFromDateAndTime(String date, String time) {
    var d = DateTime.parse(date);

    return DateTime(d.year, d.month, d.day, DateFormat("HH:mm:ss").parse(time).hour, DateFormat("HH:mm:ss").parse(time).minute,
            DateFormat("HH:mm:ss").parse(time).second).add(Duration(minutes: DateTime.now().timeZoneOffset.inMinutes));
  }

  static String formatDateV3(String? date) {
    String day = DateFormat("dd").format(DateTime.parse(date!));
    String month =
    DateFormat("MMMM",AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    String year = DateFormat("yyyy").format(DateTime.parse(date).toLocal());
    return '$month $day,$year';
  }

  static String dayNameFormat(String date) {
    return DateFormat('EEEE', AppSession.getLangKey()).format(DateTime.parse(date));
  }

  static String dayNumberFromDate(String date) {
    String day = DateFormat("d").format(DateTime.parse(date));
    return day.toString();
  }

  static String formatDate2(String date) {
    if (date.isEmpty) {
      return "";
    }
    DateTime finalDate = DateTime.parse(date).add(Duration(minutes: DateTime.now().timeZoneOffset.inMinutes));
    String day = DateFormat("dd", AppSession.getLangKey()).format(finalDate);
    String month = DateFormat("MM", AppSession.getLangKey()).format(finalDate);
    String year = DateFormat("yyyy", AppSession.getLangKey()).format(finalDate);
    return "$year-$month-$day";
  }

  static String formatDateWithMonthName(String date) {
    String day = DateFormat("dd", AppSession.getLangKey()).format(DateTime.parse(date));
    String month = DateFormat("MMMM", AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    String year = DateFormat("yyyy", AppSession.getLangKey()).format(DateTime.parse(date).toLocal());
    return "$day $month $year";
  }

  static String timeFromDateAndTimeString(String dateTime) {
    var d = DateTime.parse(dateTime);

    var t = DateTime(d.year, d.month, d.day, d.hour, d.minute, d.second);
    return DateFormat("h:mm a").format(t);
  }

  static String timeFromDateAndTimeInNotificationString(String dateTime) {
    var d = DateTime.parse(dateTime);

    var t = DateTime(d.year, d.month, d.day, d.hour, d.minute, d.second).add(Duration(minutes: DateTime.now().timeZoneOffset.inMinutes));
    return DateFormat("h:mm a").format(t);
  }
}
