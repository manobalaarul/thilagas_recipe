import 'package:intl/intl.dart';

String displayPriceInRupees(int price) {
  return NumberFormat.currency(locale: "en_IN", symbol: "₹").format(price);
}
