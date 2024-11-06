void main() {
  List<double> itemPrices = [5.99, 15.49, 25.00, 8.99, 19.99];
  double threshold = 10.0;
  double taxRate = 0.07; // 7% tax
  double discountPercentage = 10; // 10% discount

  // Filter items above the threshold using an anonymous function
  var filteredPrices = itemPrices.where((price) => price >= threshold).toList();

  // Apply discount to filtered prices
  List<double> discountedPrices = applyDiscount(filteredPrices, (price) {
    return price * (1 - (discountPercentage / 100));
  });

  // Calculate total with tax
  double totalPrice = calculateTotal(discountedPrices, tax: taxRate);
  
  // Calculate factorial discount
  double factorialDiscount = calculateFactorialDiscount(filteredPrices.length);
  
  // Apply factorial discount
  double finalPrice = totalPrice * (1 - (factorialDiscount / 100));

  // Print final results
  print("Original Prices: $itemPrices");
  print("Filtered Prices: $filteredPrices");
  print("Discounted Prices: $discountedPrices");
  print("Total Price before Factorial Discount: \$${totalPrice.toStringAsFixed(2)}");
  print("Factorial Discount: $factorialDiscount%");
  print("Final Price after Factorial Discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Function to calculate total price with optional tax parameter
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = prices.reduce((a, b) => a + b);
  return total + (total * tax);
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) return 1.0; // 1! = 1
  return n * calculateFactorialDiscount(n - 1); // n! = n * (n-1)!
}
