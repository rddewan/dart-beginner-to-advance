// 9.4 Enums (Enumerations)

// 1. Basic Enum
enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

// Function that uses a basic enum
void checkDayType(Day day) {
  switch (day) {
    case Day.saturday:
    case Day.sunday:
      print('$day is a weekend day.');
      break;
    default:
      print('$day is a weekday.');
  }
}

// 2. Enhanced Enum (Dart 2.17+)
// Represents traffic light colors with associated duration and a method.
enum TrafficLight {
  red(duration: 30, message: 'Stop!'),
  yellow(duration: 5, message: 'Prepare to stop!'),
  green(duration: 45, message: 'Go!'),
  ; // Semicolon required after the last enum value when adding members

  // Instance variables (members)
  final int duration;
  final String message;

  // Constructor for the enum values
  const TrafficLight({required this.duration, required this.message});

  // Method for the enum
  void displayInfo() {
    print('Color: ${name.capitalize()}, Duration: ${duration}s, Instruction: $message');
  }

  // You can also add static methods or getters
  static TrafficLight get defaultLight => TrafficLight.red;
}

// Extension for String to capitalize (reused from 9.3)
extension StringCapitalizeExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

// 3. Enhanced Enum implementing an interface
abstract class VehicleAction {
  void performAction();
}

enum VehicleStatus implements VehicleAction {
  stopped('Vehicle is stationary.'),
  moving('Vehicle is in motion.'),
  parking('Vehicle is parking.'),
  ;

  final String description;
  const VehicleStatus(this.description);

  @override
  void performAction() {
    switch (this) {
      case VehicleStatus.stopped:
        print('Action: Apply brakes.');
        break;
      case VehicleStatus.moving:
        print('Action: Maintain speed or accelerate.');
        break;
      case VehicleStatus.parking:
        print('Action: Engage parking assist.');
        break;
    }
  }

  void describe() {
    print('Status: ${name.capitalize()} - $description');
  }
}


void main() {
  print('--- Basic Enum Usage ---');
  print('Today is: ${Day.monday}'); // Output: Day.monday
  print('Is Day.sunday a weekend? ${Day.sunday.index > 4}'); // Output: true
  print('All days: ${Day.values}'); // Output: [Day.monday, Day.tuesday, ..., Day.sunday]

  checkDayType(Day.wednesday); // Output: Day.wednesday is a weekday.
  checkDayType(Day.saturday);   // Output: Day.saturday is a weekend day.

  print('\n--- Enhanced Enum (TrafficLight) ---');
  TrafficLight currentLight = TrafficLight.red;
  currentLight.displayInfo(); // Output: Color: Red, Duration: 30s, Instruction: Stop!

  TrafficLight nextLight = TrafficLight.yellow;
  nextLight.displayInfo(); // Output: Color: Yellow, Duration: 5s, Instruction: Prepare to stop!

  print('Default light: ${TrafficLight.defaultLight.name.capitalize()}'); // Output: Default light: Red

  // Using enhanced enum in a switch expression (Dart 3.0+)
  String lightAction = switch (currentLight) {
    TrafficLight.red => 'Wait for green.',
    TrafficLight.yellow => 'Prepare to stop or clear intersection.',
    TrafficLight.green => 'Drive safely!',
  };
  print('Action for red light: $lightAction'); // Output: Action for red light: Wait for green.

  print('\n--- Enhanced Enum Implementing Interface (VehicleStatus) ---');
  VehicleStatus status1 = VehicleStatus.moving;
  status1.describe();      // Output: Status: Moving - Vehicle is in motion.
  status1.performAction(); // Output: Action: Maintain speed or accelerate.

  VehicleStatus status2 = VehicleStatus.parking;
  status2.describe();      // Output: Status: Parking - Vehicle is parking.
  status2.performAction(); // Output: Action: Engage parking assist.

  // Polymorphism with enum implementing an interface
  List<VehicleAction> actions = [VehicleStatus.stopped, VehicleStatus.moving];
  print('\n--- Polymorphic Vehicle Actions ---');
  for (var action in actions) {
    action.performAction();
  }
}