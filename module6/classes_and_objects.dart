// 6.2 Classes and Objects

// Define a class named 'Dog'
class Dog {
  // Instance variables (properties)
  String name; // Represents the dog's name
  String breed; // Represents the dog's breed
  int age;     // Represents the dog's age

  // Constructor: A special method used to create and initialize objects of the class.
  // This is a shorthand constructor for initializing instance variables.
  Dog(this.name, this.breed, this.age);

  // Instance method (behavior)
  void bark() {
    print('$name says Woof! Woof!');
  }

  // Another instance method
  void fetch(String item) {
    print('$name is fetching the $item.');
  }

  // Method to display dog's details
  void displayInfo() {
    print('Name: $name, Breed: $breed, Age: $age years old.');
  }
}

void main() {
  print('--- Creating Objects and Using Class Members ---');

  // Create an object (instance) of the Dog class
  // Using the 'new' keyword is optional in modern Dart
  Dog myDog = Dog('Buddy', 'Golden Retriever', 3);

  // Access instance variables using dot notation
  print('My dog\'s name is ${myDog.name}.'); // Output: My dog's name is Buddy.
  print('My dog\'s breed is ${myDog.breed}.'); // Output: My dog's breed is Golden Retriever.

  // Call instance methods using dot notation
  myDog.bark();       // Output: Buddy says Woof! Woof!
  myDog.fetch('ball'); // Output: Buddy is fetching the ball.
  myDog.displayInfo(); // Output: Name: Buddy, Breed: Golden Retriever, Age: 3 years old.

  print('\n--- Creating Another Object ---');
  // Create another object of the same class
  Dog neighborsDog = Dog('Max', 'German Shepherd', 5);
  neighborsDog.displayInfo(); // Output: Name: Max, Breed: German Shepherd, Age: 5 years old.
  neighborsDog.bark();        // Output: Max says Woof! Woof!

  // Objects are independent
  print('\nAre myDog and neighborsDog the same object? ${myDog == neighborsDog}'); // Output: false
}