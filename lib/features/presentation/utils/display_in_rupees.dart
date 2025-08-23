import 'package:intl/intl.dart';

String displayPriceInRupees(num price) {
  return NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 2,
  ).format(price);
}
