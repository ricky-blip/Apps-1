import 'package:intl/intl.dart';

class Config {
  //url untuk akses endpoint API

  static String urlApi = "https://syntop.sydemy.com/api/";

  //url untuk akses endpoint API
  static String urlMain = "https://syntop.sydemy.com/";

  //format idr
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currentFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR. ',
      decimalDigits: decimalDigit,
    );

    return currentFormatter.format(number);
  }
}
