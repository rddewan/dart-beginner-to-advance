// 6.3 Constructors

// Class demonstrating different constructor types
class Point {
  final double x;
  final double y;

  // 1. Unnamed Generative Constructor (Default if no other is defined, or explicit here)
  // Shorthand syntax for initializing final fields
  Point(this.x, this.y) {
    print('Unnamed constructor called: ($x, $y)');
  }

  // 2. Named Generative Constructor
  Point.origin() : x = 0.0, y = 0.0 {
    print('Named constructor .origin() called: ($x, $y)');
  }

  Point.fromList(List<double> coordinates)
      : x = coordinates[0],
        y = coordinates[1] {
    print('Named constructor .fromList() called: ($x, $y)');
  }

  // 3. Factory Constructor
  // Can return an existing instance or an instance of a subclass
  // Cannot use 'this'
  static final Map<String, Point> _cache = {};
  factory Point.cached(double x, double y) {
    final key = '$x,$y';
    if (_cache.containsKey(key)) {
      print('Returning cached Point for ($x, $y)');
      return _cache[key]!;
    } else {
      final newPoint = Point(x, y); // Calls a generative constructor
      _cache[key] = newPoint;
      print('Creating and caching new Point for ($x, $y)');
      return newPoint;
    }
  }

  // 4. Constant Constructor
  // All instance variables must be final
  // Creates compile-time constants
  const Point.constant(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  print('--- Unnamed Generative Constructor ---');
  Point p1 = Point(10.0, 20.0); // Calls the unnamed constructor
  print('p1: $p1');

  print('\n--- Named Generative Constructors ---');
  Point pOrigin = Point.origin(); // Calls the .origin() named constructor
  print('pOrigin: $pOrigin');

  Point pFromList = Point.fromList([5.0, 15.0]); // Calls the .fromList() named constructor
  print('pFromList: $pFromList');

  print('\n--- Factory Constructors ---');
  Point cachedP1 = Point.cached(1.0, 1.0); // Creates and caches
  Point cachedP2 = Point.cached(2.0, 2.0); // Creates and caches
  Point cachedP3 = Point.cached(1.0, 1.0); // Returns cached instance

  print('cachedP1: $cachedP1');
  print('cachedP2: $cachedP2');
  print('cachedP3: $cachedP3');
  print('cachedP1 and cachedP3 are the same object: ${identical(cachedP1, cachedP3)}'); // Output: true

  print('\n--- Constant Constructors ---');
  const Point constP1 = Point.constant(100.0, 200.0);
  const Point constP2 = Point.constant(100.0, 200.0); // Dart reuses the same object for identical constants

  print('constP1: $constP1');
  print('constP2: $constP2');
  print('constP1 and constP2 are identical: ${identical(constP1, constP2)}'); // Output: true (due to canonicalization)

  // Non-constant instance of a class with a const constructor
  Point nonConstP = Point.constant(50.0, 60.0);
  print('nonConstP: $nonConstP');
}