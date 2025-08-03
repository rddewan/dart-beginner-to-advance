// 9.1 Generics

// 1. Generic Class
// This Box class can hold any type of value.
class Box<T> {
  T value; // The type of value is determined when the Box is created.

  Box(this.value);

  T getValue() {
    return value;
  }

  void setValue(T newValue) {
    value = newValue;
  }

  @override
  String toString() => 'Box containing: $value (Type: ${value.runtimeType})';
}

// 2. Generic Function
// This function can find the first element of any list type.
T getFirstElement<T>(List<T> list) {
  if (list.isEmpty) {
    throw ArgumentError('List cannot be empty.');
  }
  return list[0];
}

// 3. Generic Method (within a non-generic class)
class DataProcessor {
  // This method can process data of any type.
  void process<T>(T data) {
    print('Processing data: $data (Type: ${data.runtimeType})');
  }

  // A generic method with a return type
  List<R> transformList<T, R>(List<T> inputList, R Function(T) transformer) {
    List<R> outputList = [];
    for (T item in inputList) {
      outputList.add(transformer(item));
    }
    return outputList;
  }
}

// 4. Bounds on Type Parameters
// This Storage class can only store items that extend (or are) the Printable interface.
abstract class Printable {
  void printDetails();
}

class Document implements Printable {
  String title;
  Document(this.title);

  @override
  void printDetails() {
    print('Document Title: $title');
  }
}

class Photo implements Printable {
  String caption;
  Photo(this.caption);

  @override
  void printDetails() {
    print('Photo Caption: $caption');
  }
}

// This generic class is constrained: T must be a Printable.
class PrintableStorage<T extends Printable> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
    print('Added item: ${item.runtimeType}');
  }

  void printAll() {
    print('\n--- Printing all items in storage ---');
    for (T item in items) {
      item.printDetails(); // We can call printDetails because T is Printable
    }
  }
}


void main() {
  print('--- Generics Example ---');

  // Using Generic Class (Box)
  Box<int> intBox = Box(123);
  print(intBox); // Output: Box containing: 123 (Type: int)
  intBox.setValue(456);
  print('New intBox value: ${intBox.getValue()}');

  Box<String> stringBox = Box('Hello Generics');
  print(stringBox); // Output: Box containing: Hello Generics (Type: String)

  Box<bool> boolBox = Box(true);
  print(boolBox); // Output: Box containing: true (Type: bool)

  // Box<double> doubleBox = Box('not a double'); // Compile-time error: A value of type 'String' can't be assigned to a variable of type 'double'.

  // Using Generic Function (getFirstElement)
  List<int> intList = [10, 20, 30];
  print('First element of intList: ${getFirstElement<int>(intList)}'); // Output: 10

  List<String> stringList = ['apple', 'banana', 'cherry'];
  print('First element of stringList: ${getFirstElement<String>(stringList)}'); // Output: apple

  try {
    List<double> emptyList = [];
    print('First element of emptyList: ${getFirstElement<double>(emptyList)}');
  } catch (e) {
    print('Caught error from empty list: $e'); // Output: Caught error from empty list: ArgumentError: List cannot be empty.
  }

  // Using Generic Method (DataProcessor)
  DataProcessor processor = DataProcessor();
  processor.process<int>(100);
  processor.process<String>('Dart is awesome');
  processor.process<List<int>>([1, 2, 3]);

  List<int> numbersToSquare = [1, 2, 3, 4];
  List<int> squared = processor.transformList<int, int>(numbersToSquare, (n) => n * n);
  print('Squared numbers: $squared'); // Output: [1, 4, 9, 16]

  List<String> names = ['Alice', 'Bob'];
  List<int> nameLengths = processor.transformList<String, int>(names, (name) => name.length);
  print('Name lengths: $nameLengths'); // Output: [5, 3]

  // Using Bounded Type Parameters (PrintableStorage)
  PrintableStorage<Document> docStorage = PrintableStorage<Document>();
  docStorage.add(Document('My First Report'));
  // docStorage.add(Photo('Vacation Pic')); // Compile-time error: The argument type 'Photo' can't be assigned to the parameter type 'Document'.
  docStorage.printAll();

  PrintableStorage<Printable> mixedStorage = PrintableStorage<Printable>();
  mixedStorage.add(Document('Project Plan'));
  mixedStorage.add(Photo('Sunset View'));
  mixedStorage.printAll();

  // PrintableStorage<String> invalidStorage = PrintableStorage<String>(); // Compile-time error: Type 'String' doesn't implement 'Printable'.
}