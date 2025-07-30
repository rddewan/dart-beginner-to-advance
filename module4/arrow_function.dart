// 4.3 Arrow Functions (Fat Arrow Syntax)

// Traditional function to add two numbers
int addNormal(int a, int b) {
  return a + b;
}

// Arrow function for the same purpose
int addArrow(int a, int b) => a + b;

// Traditional function to check if a number is even
bool isEvenNormal(int number) {
  return number % 2 == 0;
}

// Arrow function for the same purpose
bool isEvenArrow(int number) => number % 2 == 0;

// Function that prints a greeting (void return type)
void greetArrow(String name) => print('Hello, $name!');

void main() {
  print('--- Arrow Functions ---');

  print('Addition (Normal): ${addNormal(10, 5)}'); // Output: 15
  print('Addition (Arrow): ${addArrow(10, 5)}');   // Output: 15

  print('Is 6 even (Normal)? ${isEvenNormal(6)}'); // Output: true
  print('Is 6 even (Arrow)? ${isEvenArrow(6)}');   // Output: true

  greetArrow('Dart Learner'); // Output: Hello, Dart Learner!

  // Arrow functions are very common with collection methods
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squaredNumbers = numbers.map((number) => number * number).toList();
  print('Squared Numbers: $squaredNumbers'); // Output: [1, 4, 9, 16, 25]

  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print('Even Numbers: $evenNumbers'); // Output: [2, 4]
}