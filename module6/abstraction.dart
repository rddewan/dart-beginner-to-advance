// 6.9 Abstract Classes

// Define an abstract class 'Shape'
abstract class Shape {
  // Abstract method: no implementation, must be implemented by concrete subclasses
  double calculateArea();

  // Abstract method: no implementation, must be implemented by concrete subclasses
  double calculatePerimeter();

  // Concrete method: has an implementation, can be inherited and optionally overridden
  void display() {
    print('This is a generic shape.');
  }
}

// Concrete subclass 'Circle' extending 'Shape'
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  // Implement the abstract method from Shape
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }

  // Implement the abstract method from Shape
  @override
  double calculatePerimeter() {
    return 2 * 3.14159 * radius;
  }

  // Optionally override a concrete method
  @override
  void display() {
    print('This is a Circle with radius $radius.');
  }
}

// Concrete subclass 'Rectangle' extending 'Shape'
class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }

  @override
  double calculatePerimeter() {
    return 2 * (width + height);
  }

  @override
  void display() {
    print('This is a Rectangle with width $width and height $height.');
  }
}

void main() {
  print('--- Abstract Classes Example ---');

  // Cannot instantiate an abstract class directly
  // Shape myShape = Shape(); // Error: Abstract classes can't be instantiated.

  // Create instances of concrete subclasses
  Circle circle = Circle(5.0);
  Rectangle rectangle = Rectangle(4.0, 6.0);

  print('\n--- Circle Details ---');
  circle.display(); // Output: This is a Circle with radius 5.0.
  print('Circle Area: ${circle.calculateArea().toStringAsFixed(2)}');      // Output: 78.54
  print('Circle Perimeter: ${circle.calculatePerimeter().toStringAsFixed(2)}'); // Output: 31.42

  print('\n--- Rectangle Details ---');
  rectangle.display(); // Output: This is a Rectangle with width 4.0 and height 6.0.
  print('Rectangle Area: ${rectangle.calculateArea().toStringAsFixed(2)}');      // Output: 24.00
  print('Rectangle Perimeter: ${rectangle.calculatePerimeter().toStringAsFixed(2)}'); // Output: 20.00

  print('\n--- Polymorphism with Abstract Classes ---');
  // You can use the abstract class type as a variable type
  List<Shape> shapes = [circle, rectangle];

  for (Shape s in shapes) {
    s.display(); // Polymorphic call to display()
    print('Area: ${s.calculateArea().toStringAsFixed(2)}');
    print('Perimeter: ${s.calculatePerimeter().toStringAsFixed(2)}');
    print('---');
  }
}