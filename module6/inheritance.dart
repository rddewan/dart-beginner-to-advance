// 6.10 Interfaces: Implicit, Explicit (`interface`), and Pure (`abstract interface`)


// 1. Implicit Interface (default behavior for any class)
class ImplicitLogger {
  void logMessage(String message) {
    print('[ImplicitLogger] $message');
  }

  String get version => '1.0';
}

class ConsoleLogger implements ImplicitLogger {
  @override
  void logMessage(String message) {
    print('[ConsoleLogger] ${DateTime.now()}: $message');
  }

  @override
  String get version => '1.1';
}

// 2. Explicit Interface with 'interface' modifier (Dart 3.0+)
// This class can be instantiated and also defines an interface.
abstract interface class Vehicle {
  void start() {
    print("Default start logic from the Vehicle interface.");
  }

  // This method doesn't have a body, so the class must be abstract.
  void stop();

  int get speed;
}

class Car implements Vehicle {
  int _currentSpeed = 0;

  @override
  void start() {
    print('Car engine started.');
  }

  @override
  void stop() {
    print('Car engine stopped.');
    _currentSpeed = 0;
  }

  @override
  int get speed => _currentSpeed;

  void accelerate(int value) {
    _currentSpeed += value;
    print('Car accelerating. Current speed: $_currentSpeed');
  }
}

class Bicycle implements Vehicle {
  int _currentSpeed = 0;

  @override
  void start() {
    print('Bicycle started pedaling.');
  }

  @override
  void stop() {
    print('Bicycle stopped.');
    _currentSpeed = 0;
  }

  @override
  int get speed => _currentSpeed;

  void pedal() {
    _currentSpeed += 5;
    print('Bicycle pedaling. Current speed: $_currentSpeed');
  }
}

// 3. Pure Interface with 'abstract interface' modifier (Dart 3.0+)
// This class cannot be instantiated and is purely a contract.
abstract interface class PaymentProcessor {
  void processPayment(double amount);
  bool validateCard(String cardNumber);
  String get processorName;
}

class CreditCardProcessor implements PaymentProcessor {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via Credit Card.');
  }

  @override
  bool validateCard(String cardNumber) {
    return cardNumber.length == 16; // Simple validation
  }

  @override
  String get processorName => 'Stripe';
}

class PayPalProcessor implements PaymentProcessor {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via PayPal.');
  }

  @override
  bool validateCard(String cardNumber) {
    return true; // PayPal doesn't directly validate card numbers here
  }

  @override
  String get processorName => 'PayPal';
}


void main() {
  print('--- Implicit Interface Example ---');
  ConsoleLogger consoleLogger = ConsoleLogger();
  consoleLogger.logMessage('This is an implicit log.');
  print('Logger version: ${consoleLogger.version}');

  print('\n--- Explicit Interface (`interface`) Example ---');
  Car myCar = Car();
  myCar.start();
  myCar.accelerate(50);
  print('Car speed: ${myCar.speed}');
  myCar.stop();

  Bicycle myBicycle = Bicycle();
  myBicycle.start();
  myBicycle.pedal();
  print('Bicycle speed: ${myBicycle.speed}');
  myBicycle.stop();

  // Polymorphism with 'interface' type
  List<Vehicle> vehicles = [myCar, myBicycle];
  print('\n--- Polymorphism with `interface` type ---');
  for (var v in vehicles) {
    v.start();
    // v.accelerate(10); // Error: Vehicle doesn't have accelerate
    print('Speed: ${v.speed}');
    v.stop();
  }

  print('\n--- Pure Interface (`abstract interface`) Example ---');
  CreditCardProcessor ccProcessor = CreditCardProcessor();
  print('Processor Name: ${ccProcessor.processorName}');
  print('Card 1234567890123456 valid: ${ccProcessor.validateCard('1234567890123456')}');
  ccProcessor.processPayment(100.50);

  PayPalProcessor ppProcessor = PayPalProcessor();
  print('Processor Name: ${ppProcessor.processorName}');
  ppProcessor.processPayment(25.75);

  // Polymorphism with 'abstract interface' type
  List<PaymentProcessor> processors = [ccProcessor, ppProcessor];
  print('\n--- Polymorphism with `abstract interface` type ---');
  for (var p in processors) {
    p.processPayment(50.0);
  }

  // PaymentProcessor pureProcessor = PaymentProcessor(); // Error: Abstract classes can't be instantiated.
}