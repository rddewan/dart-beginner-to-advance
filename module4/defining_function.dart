// 4.1 Defining Functions

// Function that returns void (no value)
void greetUser(String name) {
  print('Hello, $name!');
}

// Function that returns an integer
int add(int a, int b) {
  return a + b;
}

// Function that returns a boolean
bool isEven(int number) {
  return number % 2 == 0;
}

// Function without parameters
void sayHello() {
  print('Hello from a parameterless function!');
}

void main() {
  // Calling functions
  greetUser('Alice'); // Output: Hello, Alice!

  int sum = add(5, 3);
  print('Sum: $sum'); // Output: Sum: 8

  print('Is 4 even? ${isEven(4)}'); // Output: Is 4 even? true
  print('Is 7 even? ${isEven(7)}'); // Output: Is 7 even? false

  sayHello(); // Output: Hello from a parameterless function!
}