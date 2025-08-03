// 6.4 The `this` Keyword

class Product {
  String name;
  double price;
  String description;

  // 1. Using `this` to distinguish between instance variables and parameters
  // This is the common shorthand for constructor parameter initialization
  Product(this.name, this.price, this.description);

  // Example where `this` is explicitly used for clarity (less common in modern Dart)
  // Product(String name, double price, String description) {
  //   this.name = name;
  //   this.price = price;
  //   this.description = description;
  // }

  // 2. Using `this` to pass the current object
  void displayProductDetails() {
    print('Product Name: ${this.name}'); // 'this' is optional here but can be used for clarity
    print('Price: \$${this.price}');
    print('Description: ${this.description}');
  }

  void comparePrice(Product otherProduct) {
    if (this.price > otherProduct.price) { // Using 'this' for the current object's price
      print('${this.name} is more expensive than ${otherProduct.name}.');
    } else if (this.price < otherProduct.price) {
      print('${this.name} is cheaper than ${otherProduct.name}.');
    } else {
      print('${this.name} has the same price as ${otherProduct.name}.');
    }
  }
}

void main() {
  print('--- Using the `this` Keyword ---');

  Product laptop = Product('Laptop', 1200.00, 'Powerful portable computer.');
  Product mouse = Product('Gaming Mouse', 75.50, 'High precision mouse.');
  Product keyboard = Product('Mechanical Keyboard', 120.00, 'Tactile typing experience.');

  laptop.displayProductDetails();
  // Output:
  // Product Name: Laptop
  // Price: $1200.0
  // Description: Powerful portable computer.

  print('\n--- Comparing Prices ---');
  laptop.comparePrice(mouse);    // Output: Laptop is more expensive than Gaming Mouse.
  mouse.comparePrice(keyboard);  // Output: Gaming Mouse is cheaper than Mechanical Keyboard.
  keyboard.comparePrice(keyboard); // Output: Mechanical Keyboard has the same price as Mechanical Keyboard.
}