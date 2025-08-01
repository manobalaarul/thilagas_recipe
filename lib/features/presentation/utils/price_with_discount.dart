int priceWithDiscount(int price, [int discount = 0]) {
  if (price.isNaN || discount.isNaN) return 0; // Handle invalid inputs
  int discountAmount = ((price * discount) / 100).round(); // Round discount
  int actualPrice = price - discountAmount;
  return actualPrice.clamp(0, price); // Prevent negative prices
}
