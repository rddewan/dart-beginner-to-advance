// 6.5 Getters and Setters

class Circle {
  double _radius; // Private instance variable using '_' prefix

  // Constructor
  Circle(this._radius);

  // Explicit Getter for 'radius'
  // Allows controlled read access to the private _radius
  double get radius => _radius;

  // Explicit Setter for 'radius'
  // Allows controlled write access with validation
  set radius(double value) {
    if (value >= 0) {
      _radius = value;
      print('Radius updated to: $_radius');
    } else {
      print('Error: Radius cannot be negative. Value not set.');
    }
  }

  // Computed property using a getter
  // Area is calculated on demand, not stored
  double get area => 3.14159 * _radius * _radius;

  // Another computed property
  double get circumference => 2 * 3.14159 * _radius;

  // Read-only property (only a getter, no setter)
  String get description => 'Circle with radius $_radius';
}

class Temperature {
  double _celsius;

  Temperature(this._celsius);

  // Getter for Celsius
  double get celsius => _celsius;

  // Setter for Celsius
  set celsius(double value) {
    _celsius = value;
  }

  // Computed property: Fahrenheit (getter only)
  double get fahrenheit => (_celsius * 9 / 5) + 32;

  // Setter for Fahrenheit (allows setting temperature in Fahrenheit)
  set fahrenheit(double value) {
    _celsius = (value - 32) * 5 / 9;
    print('Temperature set to $_celsius Celsius (${value} Fahrenheit)');
  }
}


void main() {
  print('--- Getters and Setters for Circle ---');
  Circle myCircle = Circle(5.0);

  // Accessing properties via getter (looks like direct access)
  print('Initial Radius: ${myCircle.radius}');      // Output: 5.0
  print('Area: ${myCircle.area.toStringAsFixed(2)}'); // Output: 78.54
  print('Circumference: ${myCircle.circumference.toStringAsFixed(2)}'); // Output: 31.42
  print('Description: ${myCircle.description}'); // Output: Circle with radius 5.0

  // Updating radius via setter (triggers validation logic)
  myCircle.radius = 7.0; // Output: Radius updated to: 7.0
  print('New Area: ${myCircle.area.toStringAsFixed(2)}'); // Output: 153.94

  myCircle.radius = -2.0; // Output: Error: Radius cannot be negative. Value not set.
  print('Radius after invalid set attempt: ${myCircle.radius}'); // Output: 7.0 (unchanged)

  print('\n--- Getters and Setters for Temperature ---');
  Temperature temp = Temperature(0.0); // 0 Celsius

  print('Initial Celsius: ${temp.celsius}');    // Output: 0.0
  print('Initial Fahrenheit: ${temp.fahrenheit}'); // Output: 32.0

  temp.celsius = 25.0; // Using Celsius setter
  print('Updated Celsius: ${temp.celsius}');    // Output: 25.0
  print('Updated Fahrenheit: ${temp.fahrenheit}'); // Output: 77.0

  temp.fahrenheit = 212.0; // Using Fahrenheit setter
  print('Celsius after setting Fahrenheit: ${temp.celsius}'); // Output: 100.0
}