import 'package:intl/intl.dart';

class CustomDateUtils {
  static String parseDateToFullDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(tempDate);
    return date;
  }

  static String parseDateToSimpleDateTimeHour(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('dd MMM y HH:mm', 'id_ID').format(tempDate);
    return date;
  }

  static String parseDateTimeToSimpleStringDateHour(DateTime dateTime) {
    String date = DateFormat('dd MMM y HH:mm', 'id_ID').format(dateTime);
    return date;
  }

  static String parseDateToDetailDisplayDate(String dateString) {
    final DateTime tempDate = DateTime.parse(dateString).toLocal(); // iso8601
    String date = DateFormat('y-MM-dd HH:mm aaa', 'id_ID').format(tempDate);
    return date;
  }

  static String dateTimeToFullDisplayDate(DateTime dateTime) {
    String date = DateFormat('EEEE, dd MMMM y', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm:ss', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToDetailDisplayDateUtc(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm:ss', 'id_ID').format(dateTime.toUtc());
    return date;
  }

  static String dateTimeToDetailDisplayDateHour(DateTime dateTime) {
    String date = DateFormat('y-MM-dd HH:mm', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  static String dateTimeToSimpleDate(DateTime dateTime) {
    String date = DateFormat('y-MM-dd', 'id_ID').format(dateTime.toLocal());
    return date;
  }

  /// Formats a [DateTime] object into a string representation following the pattern 'y-MM-dd\'T\'HH:mm:ss.SSS\'Z\''.
  ///
  /// The [dateTime] parameter is the [DateTime] object that will be formatted.
  /// The function first converts the [DateTime] object to UTC time before formatting it.
  ///
  /// Returns a [String] representing the formatted date and time in UTC.
  ///
  /// Example:
  /// ```
  /// DateTime now = DateTime.now();
  /// String formatted = CustomDateUtils.dateTimeToUtcZoned(now);
  /// print(formatted);  // Output: '2022-03-15T18:20:45.123Z'
  /// ```
  static String dateTimeToUtcZoned(DateTime dateTime) {
    String date = DateFormat('y-MM-dd\'T\'HH:mm:ss.SSS\'Z\'', 'id_ID').format(dateTime.toUtc());
    return date;
  }

  /// Parses a UTC zoned date string in the format `y-MM-dd'T'HH:mm:ss.SSS'Z'` to a [DateTime] object.
  ///
  /// [dateString] should be an ISO8601 string, e.g. `'2022-03-15T18:20:45.123Z'`.
  /// Returns a [DateTime] in UTC.
  ///
  /// Example:
  /// ```dart
  /// final date = CustomDateUtils.parseUtcZonedDate('2022-03-15T18:20:45.123Z');
  /// print(date); // Output: 2022-03-15 18:20:45.123Z
  /// ```
  static DateTime parseUtcZonedDate(String dateString) {
    if (dateString.isNotEmpty) {
      final dateFormat = DateFormat("y-MM-dd'T'HH:mm:ss.SSS'Z'", 'id_ID');
      return dateFormat.parseUtc(dateString);
    } else {
      return DateTime.now().toUtc();
    }
  }

  static String dateTimeISO8601(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  /// Generate current date
  ///
  /// Returns [String] the current date and time in UTC format
  /// example [dateCode] // 20210101
  static String dateCode() {
    final DateTime dateTime = DateTime.now();
    final int monthDefault = dateTime.month; //months from 1-12
    final String year = dateTime.year.toString();
    final String month = (monthDefault < 10 ? '0' : '') + monthDefault.toString();
    final String day = (dateTime.day < 10 ? '0' : '') + dateTime.day.toString();
    final String now = '$year$month$day';
    return now;
  }

  /// Generate current time transaction
  ///
  /// Returns [String] the current hours, minutes and seconds in UTC format as a string
  /// example [timeTransaction] // 200215
  static String timeTransaction() {
    final DateTime dateTime = DateTime.now();
    final String hours = '${dateTime.hour < 10 ? '0' : ''}${dateTime.hour}';
    final String minutes = '${dateTime.minute < 10 ? '0' : ''}${dateTime.minute}';
    final String seconds = '${dateTime.second < 10 ? '0' : ''}${dateTime.second}';
    final String time = '$hours$minutes$seconds';
    return time;
  }

  /// Generate current date time transaction
  ///
  /// Returns [String] the current year, month, day, hours, minutes, seconds and millisecond in UTC format as a string
  /// example [dateUTCBuyItems] // 2022-06-29 07:40:59.76+00
  static String dateUTCBuyItems() {
    final DateTime dateTime = DateTime.now().toUtc();
    final int monthDefault = dateTime.month; //months from 1-12
    final String year = dateTime.year.toString();
    final String month = (monthDefault < 10 ? '0' : '') + monthDefault.toString();
    final String day = (dateTime.day < 10 ? '0' : '') + dateTime.day.toString();

    final String hours = '${dateTime.hour < 10 ? '0' : ''}${dateTime.hour}';
    final String minutes = '${dateTime.minute < 10 ? '0' : ''}${dateTime.minute}';
    final String seconds = '${dateTime.second < 10 ? '0' : ''}${dateTime.second}';
    final String milliseconds = '${dateTime.millisecond}';

    final String dateUTC = '$year-$month-$day $hours:$minutes:$seconds.$milliseconds+00';
    return dateUTC;
  }

  // Parse string date to "6 Desember 2024, 15:00 WIB"
  static String parseDateStringToDetailDisplay(String dateString) {
    if (dateString.isEmpty) return '-';
    final DateTime tempDate = DateTime.parse(dateString).toLocal();
    String date = DateFormat('d MMMM y, HH:mm', 'id_ID').format(tempDate);
    return date;
  }

  /// Formats a date string into 'dd MMM y - hh.mm a' using Indonesian locale.
  ///
  /// [dateString] should be a valid ISO8601 date string.
  /// Returns a formatted date string, e.g. '29 Jun 2024 - 03.15 PM'.
  static String formatCustomDate(String dateString) {
    final dateTime = DateTime.parse(dateString).toLocal();
    return DateFormat('dd MMM y - hh.mm a', 'id_ID').format(dateTime);
  }

  /// Parses a string formatted by [formatCustomDate] back to a [DateTime] object.
  /// Expected format: 'dd MMM y - hh.mm a', locale: 'id_ID'
  /// Throws [FormatException] if the input does not match the expected format.
  static DateTime parseCustomDate(String dateString) {
    final dateFormat = DateFormat('dd MMM y - hh.mm a', 'id_ID');
    return dateFormat.parseStrict(dateString);
  }

  /// Formats a [DateTime] object into a string suitable for marketplace filters.
  ///
  /// The output format is `yyyy-MM-ddTHH%3AMM`,
  /// Example: `2024-06-29T15:00`
  ///
  /// [dateTime] is the date and time to format.
  ///
  /// Returns a formatted string for use in marketplace filter queries.
  static String formatDateTimeForFilterMarketplace(DateTime dateTime) {
    final formatted = '${dateTime.year.toString().padLeft(4, '0')}-'
        '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')}T'
        '${dateTime.hour.toString().padLeft(2, '0')}'
        ':'
        '${dateTime.minute.toString().padLeft(2, '0')}';
    return formatted;
  }

  /// Parses a marketplace filter date string (`yyyy-MM-ddTHH:MM`) into a [DateTime] object.
  ///
  /// Example: `2024-06-29T15:00` returns a DateTime for 2024-06-29 15:00.
  static DateTime parseFilterMarketplaceDateTime(String dateString) {
    final regex = RegExp(r'^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})$');
    final match = regex.firstMatch(dateString);
    if (match == null) {
      throw const FormatException('Invalid marketplace filter date format');
    }
    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final day = int.parse(match.group(3)!);
    final hour = int.parse(match.group(4)!);
    final minute = int.parse(match.group(5)!);
    return DateTime(year, month, day, hour, minute);
  }

  /// Formats a [DateTime] object into a string using the provided [pattern] and Indonesian locale.
  ///
  /// Returns the formatted date string, or an empty string if formatting fails.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2024, 6, 29, 15, 0);
  /// final formatted = CustomDateUtils.formatDateTimeToPattern(date, 'dd MMM y HH:mm');
  /// print(formatted); // Output: '29 Jun 2024 15:00'
  /// ```
  static String formatDateTimeFromPattern(DateTime dateTime, String pattern) {
    try {
      return DateFormat(pattern, 'id_ID').format(dateTime.toLocal());
    } catch (e) {
      return '';
    }
  }
}
