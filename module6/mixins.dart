// 6.11 Mixins

// A mixin for logging capabilities
mixin Logging {
  void log(String message) {
    print('[LOG] ${DateTime.now()}: $message');
  }
}

// A mixin for a specific movement capability
mixin Swimmer {
  void swim() {
    print('Swimming gracefully.');
  }
}

// A mixin that requires the class to be an Animal (using 'on' keyword)
mixin Flyer on Animal {
  void fly() {
    print('${name} is flying high!');
  }
}

// A base Animal class (from previous examples)
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name is eating.');
  }
}

// A Duck class that extends Animal and uses multiple mixins
class Duck extends Animal with Logging, Swimmer, Flyer {
  Duck(String name, int age) : super(name, age);

  void quack() {
    log('$name says Quack!'); // Using log from Logging mixin
    print('$name is quacking.');
  }

  // Overriding a method that might be in a mixin or superclass
  @override
  void swim() {
    log('$name is doing a special duck swim.'); // Using log from Logging mixin
    print('$name is doing a special duck swim.');
  }
}

// A Fish class that uses only the Swimmer mixin
class Fish extends Animal with Swimmer {
  Fish(String name, int age) : super(name, age);

  void blowBubbles() {
    print('$name is blowing bubbles.');
  }
}

// A Bird class that extends Animal and uses Flyer mixin
class Bird extends Animal with Flyer {
  Bird(String name, int age) : super(name, age);

  void chirp() {
    print('$name is chirping.');
  }
}


void main() {
  print('--- Mixins Example ---');

  Duck donald = Duck('Donald', 2);
  donald.eat();       // From Animal
  donald.quack();     // Specific to Duck, uses Logging mixin
  donald.swim();      // Overridden in Duck, uses Logging mixin
  donald.fly();       // From Flyer mixin (because Duck is an Animal)

  print('\n--- Fish Example ---');
  Fish nemo = Fish('Nemo', 1);
  nemo.eat();       // From Animal
  nemo.swim();      // From Swimmer mixin
  nemo.blowBubbles(); // Specific to Fish
  // nemo.fly(); // Error: The method 'fly' isn't defined for the type 'Fish'. (Fish doesn't use Flyer)

  print('\n--- Bird Example ---');
  Bird robin = Bird('Robin', 1);
  robin.eat();    // From Animal
  robin.fly();    // From Flyer mixin
  robin.chirp();  // Specific to Bird

  // Demonstrating mixin precedence (rightmost wins)
  // If you had: class MyClass with MixinA, MixinB { ... }
  // And both MixinA and MixinB had a method 'doSomething()', MixinB's would be used.
  // If MyClass also had doSomething(), MyClass's would be used.


  robin.fly();    // From Flyer mixin
  robin.chirp();  // Specific to Bird

  // Demonstrating mixin precedence (rightmost wins)
  // If you had: class MyClass with MixinA, MixinB { ... }
  // And both MixinA and MixinB had a method 'doSomething()', MixinB's would be used.
  // If MyClass also had doSomething(), MyClass's would be used.
}