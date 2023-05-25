class DatetimeUtils {
  DatetimeUtils._();

  static String getDateString(DateTime dateTime) {
    return "${dateTime.year}${dateTime.month}${dateTime.day}";
  }
}
