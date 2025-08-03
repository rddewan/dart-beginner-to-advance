// module6/interfaces.dart
// This Dart code demonstrates the use of interfaces in different forms:


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
interface class Vehicle {
  void moveForward(int meters) {
    // ...
  }
}

class Car implements Vehicle {
  int _currentSpeed = 0;

  @override
  void moveForward(int meters) {
    print('Car moving forward $meters meters at speed $_currentSpeed.');
  }

  void accelerate(int value) {
    _currentSpeed += value;
    print('Car accelerating. Current speed: $_currentSpeed');
  }
}


// this is allowed in same library ( same file )
// but not in other libraries (other files) 
class Bicycle extends Vehicle {
  int _currentSpeed = 0;

 
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
  myCar.moveForward(100);
  myCar.accelerate(50);


  Bicycle myBicycle = Bicycle();
  myBicycle.moveForward(20);
  myBicycle.pedal();



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