import '../../domain/entities/cart/cart_response_entity.dart';

double calculateTotalKg(List<Cart> cartItems) {
  double totalKg = 0;

  for (final item in cartItems) {
    final variantName = item.variant.name;
    if (variantName.isEmpty) continue;

    final regex = RegExp(r'(\d+)(mg|g|gm|kg)', caseSensitive: false);
    final matches = regex.allMatches(variantName);

    double itemWeightKg = 0;

    for (final match in matches) {
      final value = double.tryParse(match.group(1) ?? '0') ?? 0;
      final unit = (match.group(2) ?? '').toLowerCase();

      double weightKg = value;

      if (unit == "g" || unit == "gm") {
        weightKg = value / 1000;
      } else if (unit == "mg") {
        weightKg = value / 1000000;
      } else if (unit == "kg") {
        weightKg = value;
      }

      itemWeightKg += weightKg;
    }

    totalKg += itemWeightKg * (item.quantity ?? 1);
  }

  return totalKg;
}
