// Example : 6.8 - Polymorphism

// Superclass (Parent Class)
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name is eating.');
  }

  void makeSound() {
    print('$name makes a generic sound.');
  }
}

// Subclass Dog - same as in 7.1
class Dog extends Animal {
  Dog(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }

  void wagTail() {
    print('$name is wagging its tail.');
  }
}

// Subclass Cat - same as in 7.1
class Cat extends Animal {
  Cat(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print('$name meows: Meow!');
  }

  void climbTree() {
    print('$name is climbing a tree.');
  }
}

// Another Subclass
class Cow extends Animal {
  Cow(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print('$name moos: Moo!');
  }

  void graze() {
    print('$name is grazing.');
  }
}

void main() {
  print('--- Polymorphism Example ---');

  // Declare variables of the superclass type (Animal)
  // but assign instances of different subclasses.
  Animal animal1 = Dog('Fido', 4);
  Animal animal2 = Cat('Luna', 2);
  Animal animal3 = Cow('Bessie', 6);

  // Call the makeSound method on each animal.
  // The specific implementation of makeSound() that gets called
  // depends on the actual type of the object at runtime.
  print('--- Animals making sounds ---');
  animal1.makeSound(); // Output: Fido barks: Woof! Woof! (Dog's makeSound)
  animal2.makeSound(); // Output: Luna meows: Meow! (Cat's makeSound)
  animal3.makeSound(); // Output: Bessie moos: Moo! (Cow's makeSound)

  // You can put different Animal types into a List of Animal
  List<Animal> farmAnimals = [
    Dog('Rex', 5),
    Cat('Mittens', 3),
    Cow('Daisy', 8),
    Animal('Birdie', 1), // A generic animal
  ];

  print('\n--- Iterating through a list of Animals ---');
  for (Animal animal in farmAnimals) {
    animal.eat();         // All animals can eat (inherited)
    animal.makeSound();   // Polymorphic call
    // You cannot call wagTail() directly here because 'animal' is declared as Animal,
    // and Animal doesn't have a wagTail() method.
    // If you need to call specific methods, you'd use type checking (is) and casting (as).
    if (animal is Dog) {
      animal.wagTail(); // Safe to call wagTail because we know it's a Dog
    } else if (animal is Cat) {
      animal.climbTree(); // Safe to call climbTree because we know it's a Cat
    } else if (animal is Cow) {
      animal.graze(); // Safe to call graze because we know it's a Cow
    }
    print('---');
  }
}