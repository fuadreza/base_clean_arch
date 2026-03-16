import 'package:intl/intl.dart';

extension IntegerExtension on int? {
  String convertToRupiahInt() {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.currency(locale: 'id_ID', decimalDigits: 0, symbol: 'Rp ');
      // convert to rupiah
      final rupiah = formatRupiah.format(
        double.parse(this!.toString()),
      );

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  String convertToRupiahDecimal({int decimal = 0}) {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.currency(locale: 'id_ID', decimalDigits: decimal, symbol: 'Rp ');
      // convert to rupiah
      final rupiah = formatRupiah.format(
        double.parse(this!.toString()),
      );

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  /// Compare To but Null Safe
  ///
  /// Compare number value this(a) with value b for null safety.
  /// put null value into last or first, with default last
  int compareToNullSafe(int? b, {bool putNullIntoLast = true}) {
    if (this == null && b == null) {
      return 0;
    } else if (this == null) {
      return putNullIntoLast ? 1 : -1;
    } else if (b == null) {
      return putNullIntoLast ? -1 : 1;
    } else {
      return this!.compareTo(b);
    }
  }

  /// Converts the integer to a string with thousand separators.
  ///
  /// Example:
  /// ```dart
  /// 1234567.toThousandSeparator(); // returns '1.234.567'
  /// 1234567.toThousandSeparator(separator: ','); // returns '1,234,567'
  /// ```
  ///
  /// [separator] defines the character to use as the thousand separator. Defaults to '.'.
  /// Returns '0' if the value is null.
  String toThousandSeparator({String separator = '.'}) {
    if (this != null) {
      final formatter = NumberFormat('#,###', 'id_ID');
      return formatter.format(this).replaceAll(',', separator);
    } else {
      return '0';
    }
  }
}
