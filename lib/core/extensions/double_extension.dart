import 'package:intl/intl.dart';

extension DoubleExtension on double? {
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

  /// Format double into currency rupiah
  ///
  /// Example:
  /// without any parameter: 10000 will return Rp 100.000
  String convertToRupiahDecimal({int decimal = 0, String symbol = 'Rp '}) {
    //Define Format
    final formatRupiah = NumberFormat.currency(locale: 'id_ID', decimalDigits: decimal, symbol: symbol);
    if (this != null) {
      // format to rupiah
      final rupiah = formatRupiah.format(
        double.parse(this!.toString()),
      );

      return rupiah;
    } else {
      return formatRupiah.format(0);
    }
  }
}
