// 4.5 Higher-Order Functions

// 1. Function that takes another function as an argument
void executeOperation(int a, int b, Function(int, int) operation) {
  int result = operation(a, b);
  print('Result of operation: $result');
}

// A simple addition function to pass as an argument
int addNumbers(int x, int y) => x + y;

// A simple multiplication function to pass as an argument
int multiplyNumbers(int x, int y) => x * y;


// 2. Function that returns another function
Function(int) createPowerCalculator(int exponent) {
  return (int base) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
    }
    return result;
  };
}

void main() {
  print('--- Higher-Order Functions ---');

  // --- Functions taking other functions as arguments ---
  print('\n--- Passing functions as arguments ---');
  executeOperation(10, 5, addNumbers);      // Output: Result of operation: 15
  executeOperation(10, 5, multiplyNumbers); // Output: Result of operation: 50

  // Using an anonymous function directly
  executeOperation(20, 4, (num1, num2) => num1 - num2); // Output: Result of operation: 16

  // Common higher-order methods on Lists
  List<int> numbers = [1, 2, 3, 4, 5];

  // forEach: takes a function to execute for each element
  print('\n--- forEach (Higher-Order) ---');
  numbers.forEach((number) => print('Value: $number'));

  // map: takes a function to transform each element, returns a new iterable
  print('\n--- map (Higher-Order) ---');
  List<String> stringNumbers = numbers.map((number) => 'Number $number').toList();
  print('Mapped to strings: $stringNumbers'); // Output: [Number 1, Number 2, Number 3, Number 4, Number 5]

  // where: takes a function (predicate) to filter elements, returns a new iterable
  print('\n--- where (Higher-Order) ---');
  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print('Even numbers: $evenNumbers'); // Output: [2, 4]

  // sort: takes a comparison function
  List<String> words = ['apple', 'zebra', 'banana', 'cat'];
  words.sort((a, b) => a.compareTo(b)); // Alphabetical sort
  print('Sorted words (alphabetical): $words'); // Output: [apple, banana, cat, zebra]
  words.sort((a, b) => b.length.compareTo(a.length)); // Sort by length (descending)
  print('Sorted words (by length descending): $words'); // Output: [banana, apple, zebra, cat]


  // --- Functions returning other functions ---
  print('\n--- Functions returning functions ---');
  var square = createPowerCalculator(2); // square is now a function that takes one int and returns its square
  var cube = createPowerCalculator(3);   // cube is now a function that takes one int and returns its cube

  print('5 squared: ${square(5)}'); // Output: 25
  print('3 cubed: ${cube(3)}');     // Output: 27
}