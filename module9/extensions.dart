// 9.3 Extensions

// 1. Extension on String to add capitalization
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}

// 2. Extension on int to add check for even/odd
extension IntExtension on int {
  bool isEvenNumber() {
    return this % 2 == 0;
  }

  bool isOddNumber() {
    return this % 2 != 0;
  }

  int square() {
    return this * this;
  }
}

// 3. Extension on List<T> to add a custom filter
extension ListFilter<T> on List<T> {
  List<T> filterBy(bool Function(T) test) {
    List<T> result = [];
    for (var item in this) {
      if (test(item)) {
        result.add(item);
      }
    }
    return result;
  }
}

// Example class to demonstrate static resolution limitation
class Animal {
  void makeSound() {
    print('Generic animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

extension AnimalExtension on Animal {
  void greet() {
    print('Hello from Animal extension!');
  }
}

extension DogExtension on Dog {
  void greet() {
    print('Hello from Dog extension!');
  }
}


void main() {
  print('--- Extensions Example ---');

  // Using String Extension
  String name = 'alice';
  print('Capitalized name: ${name.capitalize()}'); // Output: Alice

  String sentence = 'hello world from dart';
  print('Title case sentence: ${sentence.toTitleCase()}'); // Output: Hello World From Dart

  // Using Int Extension
  int number = 7;
  print('$number is even? ${number.isEvenNumber()}'); // Output: 7 is even? false
  print('$number is odd? ${number.isOddNumber()}');   // Output: 7 is odd? true
  print('$number squared: ${number.square()}');       // Output: 49

  // Using List Extension
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<int> evenNumbers = numbers.filterBy((n) => n.isEvenNumber());
  print('Even numbers from list: $evenNumbers'); // Output: [2, 4, 6, 8, 10]

  List<String> fruits = ['apple', 'banana', 'cherry', 'date'];
  List<String> longFruits = fruits.filterBy((fruit) => fruit.length > 5);
  print('Fruits with length > 5: $longFruits'); // Output: [banana, cherry]

  // Demonstrating static resolution limitation
  print('\n--- Extension Static Resolution ---');
  Animal myAnimal = Dog(); // Declared type is Animal, runtime type is Dog
  myAnimal.makeSound();    // Calls Dog's overridden method: Woof!
  myAnimal.greet();        // Calls AnimalExtension's greet: Hello from Animal extension!
                           // (Even though the runtime object is a Dog, the extension is resolved based on the static type 'Animal')

  Dog myDog = Dog();       // Declared type is Dog
  myDog.greet();           // Calls DogExtension's greet: Hello from Dog extension!
}