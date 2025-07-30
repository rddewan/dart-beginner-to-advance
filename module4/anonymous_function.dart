// 4.4 Anonymous Functions (Lambdas)

void main() {
  print('--- Anonymous Functions ---');

  // Anonymous function assigned to a variable
  var multiply = (int a, int b) {
    return a * b;
  };
  print('Multiplication: ${multiply(4, 5)}'); // Output: 20

  // Anonymous function as a callback for List.forEach
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print('\nIterating with forEach:');
  fruits.forEach((fruit) {
    print('I like $fruit');
  });
  // Output:
  // I like Apple
  // I like Banana
  // I like Cherry

  // Anonymous function with arrow syntax for List.map
  List<int> numbers = [1, 2, 3];
  List<String> doubledAndFormatted = numbers.map((number) => 'Number ${number * 2}').toList();
  print('\nDoubled and Formatted Numbers: $doubledAndFormatted'); // Output: [Number 2, Number 4, Number 6]

  // Anonymous function for sorting a list
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David'];
  // Sort by length of the string
  names.sort((a, b) => a.length.compareTo(b.length));
  print('\nNames sorted by length: $names'); // Output: [Bob, Alice, David, Charlie]

  // Anonymous function capturing a variable from its outer scope (closure)
  Function createMultiplier(int factor) {
    return (int number) => number * factor; // 'factor' is captured
  }

  var multiplyByTwo = createMultiplier(2);
  var multiplyByTen = createMultiplier(10);

  print('\nUsing closures:');
  print('5 multiplied by two: ${multiplyByTwo(5)}');   // Output: 10
  print('5 multiplied by ten: ${multiplyByTen(5)}'); // Output: 50
}