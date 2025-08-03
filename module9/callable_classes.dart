// 9.5 Callable Classes

// A class that converts a temperature from Celsius to Fahrenheit
class CelsiusToFahrenheitConverter {
  // Implementing the call method makes instances of this class callable.
  double call(double celsius) {
    return (celsius * 9 / 5) + 32;
  }
}

// A class that performs a simple greeting based on a name
class Greeter {
  final String greetingPrefix;

  Greeter(this.greetingPrefix);

  // This call method takes a String (name) and returns a String (full greeting).
  String call(String name) {
    return '$greetingPrefix, $name!';
  }
}

// A class that acts as a simple counter function
class Counter {
  int _count = 0;

  // The call method here acts as a getter for the current count
  // and increments it for the next call.
  int call() {
    _count++;
    return _count;
  }

  int get currentCount => _count;
}

void main() {
  print('--- Callable Classes Example ---');

  // Create an instance of the CelsiusToFahrenheitConverter class
  var converter = CelsiusToFahrenheitConverter();

  // Call the instance like a function
  double tempInFahrenheit = converter(25.0); // Invokes the call method
  print('25 Celsius is $tempInFahrenheit Fahrenheit.'); // Output: 25 Celsius is 77.0 Fahrenheit.

  double anotherTemp = converter(0.0);
  print('0 Celsius is $anotherTemp Fahrenheit.'); // Output: 0 Celsius is 32.0 Fahrenheit.

  print('\n--- Greeter Example ---');
  var formalGreeter = Greeter('Greetings');
  print(formalGreeter('Alice')); // Output: Greetings, Alice!

  var casualGreeter = Greeter('Hi');
  print(casualGreeter('Bob')); // Output: Hi, Bob!

  print('\n--- Counter Example ---');
  var counter = Counter();
  print('Count: ${counter()}'); // Output: Count: 1
  print('Count: ${counter()}'); // Output: Count: 2
  print('Count: ${counter()}'); // Output: Count: 3
  print('Current count property: ${counter.currentCount}'); // Output: Current count property: 3

  // Callable classes can be used where a Function type is expected
  List<int> numbers = [1, 2, 3];
  // Use the converter as a transformer in map, converting int to double
  List<double> fahrenheitTemps = numbers.map((n) => converter(n.toDouble())).toList();
  print('Temperatures in Fahrenheit: $fahrenheitTemps'); // Output: [33.8, 35.6, 37.4]
}