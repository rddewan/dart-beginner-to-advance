// 9.2 Type Definitions (Type Aliases)

// 1. `typedef` for Function Types (Traditional/Legacy and still valid)
// Defines a type 'Operation' that represents a function taking two ints and returning an int.
typedef MathOperation = int Function(int a, int b);

// A function that uses the typedef as a parameter type
void executeMathOperation(int x, int y, MathOperation operation) {
  int result = operation(x, y);
  print('Result of math operation: $result');
}

// Concrete functions matching the MathOperation signature
int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;


// 2. `typedef` for Any Type (Dart 2.13+)
// Creating aliases for common types or complex generic types.

typedef UserID = String; // Alias for String
typedef Email = String;   // Alias for String, provides semantic meaning

typedef JsonMap = Map<String, dynamic>; // Alias for a common Map structure

// A complex nested generic type alias
typedef UserPermissions = Map<String, List<String>>;

class User {
  UserID id;
  Email email;
  String name;
  UserPermissions permissions;

  User({required this.id, required this.email, required this.name, required this.permissions});

  void displayInfo() {
    print('User ID: $id');
    print('Name: $name');
    print('Email: $email');
    print('Permissions: $permissions');
  }
}

// Function returning a complex type using typedef
typedef Point2D = ({double x, double y}); // Record type alias (Dart 3.0+)

Point2D createPoint(double x, double y) {
  return (x: x, y: y);
}


void main() {
  print('--- Type Definitions Example ---');

  // Using function type typedef
  executeMathOperation(10, 5, add);      // Output: Result of math operation: 15
  executeMathOperation(10, 5, subtract); // Output: Result of math operation: 5
  executeMathOperation(20, 4, (a, b) => a * b); // Using an anonymous function

  // Using general type aliases
  UserID userId1 = 'user_123';
  Email userEmail1 = 'test@example.com';
  print('User ID: $userId1, Email: $userEmail1');

  JsonMap userData = {
    'name': 'Alice',
    'age': 30,
    'isActive': true,
  };
  print('User Data (JsonMap): $userData');

  UserPermissions adminPermissions = {
    'admin': ['read', 'write', 'delete'],
    'reports': ['view', 'export'],
  };

  User newUser = User(
    id: 'user_456',
    email: 'alice@example.com',
    name: 'Alice Smith',
    permissions: adminPermissions,
  );
  print('\n--- New User Info ---');
  newUser.displayInfo();

  // Using record type alias (Dart 3.0+)
  Point2D myPoint = createPoint(10.5, 20.3);
  print('\nCreated Point: x=${myPoint.x}, y=${myPoint.y}');
}