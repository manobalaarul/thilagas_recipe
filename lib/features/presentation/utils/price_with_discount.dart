int priceWithDiscount(int price, [int discount = 0]) {
  if (price < 0 || discount < 0) return 0; // validation

  int discountAmount = ((price * discount) / 100).ceil(); // ceil like JS
  int actualPrice = price - discountAmount;

  return actualPrice.clamp(0, price); // avoid negatives
}
