import 'package:intl/intl.dart';

import '../../data/repository/app_session.dart';

class StringFormatters {
  static String formatDate({
    String? date,
    String format = "hh:mm a dd MMMM yyyy",
  }) {
    DateFormat dateFormat = DateFormat(format, AppSession.getLangKey());
    DateTime parsedDate = DateTime.parse(date ?? "0000-00-00T00:00:00.000Z");
    return dateFormat.format(parsedDate);
  }
}
