# Module 6: Object-Oriented Programming (OOP)

## 6.1 Introduction to OOP

**Explanation:**  
Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data (attributes or properties) and code (methods or behaviors). OOP aims to make software development more modular, reusable, and maintainable. Dart is a fully object-oriented language, meaning everything in Dart is an object, even numbers, functions, and null.

### Core Concepts

1. **Objects**
   - Instances of classes
   - Represent real-world entities
   - Contain state (data) and behavior (methods)

2. **Classes**
   - Blueprints for creating objects
   - Define properties and methods

3. **Encapsulation**
   - Bundling data and methods
   - Protecting data integrity
   - Restricting access to components

4. **Inheritance**
   - Code reuse mechanism
   - Parent-child class relationships
   - Promotes hierarchical structure

5. **Polymorphism**
   - Objects take multiple forms
   - Flexibility in design
   - Runtime method selection

6. **Abstraction**
   - Hide implementation details
   - Show essential features only
   - Focus on what, not how

### Benefits

- **Modularity:** Break down complex problems
- **Reusability:** Share code across projects
- **Maintainability:** Easier debugging
- **Flexibility:** Extensible designs
- **Security:** Protected data access

## 6.2 Classes and Objects
**Explanation:**  
A class is the fundamental building block of OOP in Dart. It's a blueprint that defines the structure and behavior of objects. An object is an instance of a class, created based on that blueprint.

### Defining a class:

- Classes are defined using the `class` keyword, followed by the class name (conventionally PascalCase).
- The class body contains instance variables (properties) and instance methods (behaviors).

### Creating objects (instances):

- Objects are created using the `new` keyword (optional in Dart 2.x and later) followed by the class name and parentheses for the constructor.
- Each object has its own unique set of instance variable values.

### Instance variables (properties) and instance methods (behaviors):

- **Instance Variables:** Variables declared within a class but outside any method. They represent the state or data of an object.
- **Instance Methods:** Functions declared within a class. They define the actions or behaviors that an object can perform.

**Code Sample:**

```dart
// 6.2 Classes and Objects

classes_and_objects.dart

```

## 6.3 Constructors
**Explanation:**  
Constructors are special methods in a class responsible for creating and initializing new objects (instances) of that class. Dart provides several types of constructors to handle different initialization scenarios.

### Default Constructor:

- If you don't declare any constructors for a class, Dart automatically provides a default, unnamed, no-argument constructor. This constructor calls the no-argument constructor in the superclass.

### Generative Constructors:

- These are the most common type of constructors. They create a new instance of the class.
- **Unnamed Constructor:** The primary constructor, often used for simple initialization.
- **Named Constructors:** Allow you to create multiple constructors for a class, each with a different name. This is useful when you want to provide different ways to create an object (e.g., `Person.fromMap`, `Person.fromJson`).

### Factory Constructors:

- Marked with the `factory` keyword.
- Unlike generative constructors, a factory constructor does not necessarily create a new instance of its class. It can return an existing instance from a cache, return an instance of a subclass, or perform complex initialization logic.
- They cannot access `this`.

### Constant Constructors:

- Marked with the `const` keyword.
- Used to create compile-time constant objects. This means the object's state is fully determined at compile time and cannot change.
- All instance variables must be `final`.
- If a class has a `const` constructor, you can create constant instances using `const ClassName(...)`. This can lead to performance benefits as Dart can reuse identical constant objects.

**Code Sample:**

```dart
// 6.3 Constructors

constructors.dart

```

## 6.4 The this Keyword
**Explanation:**  
The `this` keyword in Dart refers to the current instance of the class. It is primarily used to:

- Distinguish between instance variables and local variables/parameters that have the same name.
- Pass the current object as an argument to another method or function.
- In generative constructors, `this.fieldName` is a shorthand to initialize instance variables directly from constructor parameters with the same name.

**Code Sample:**

```dart
// 6.4 The `this` Keyword

this_keyword.dart

```

## 6.5 Getters and Setters
**Explanation:**  
Getters and setters are special methods that provide controlled access to a class's properties (instance variables). They allow you to define custom logic for reading (getting) and writing (setting) values, rather than directly exposing the underlying variable. This is a core aspect of encapsulation.

### Implicit getters/setters:

- By default, Dart automatically generates an implicit getter and setter for every public instance variable (unless it's final or const, in which case only a getter is generated).
- For example, `String name;` implicitly creates `String get name => _name;` and `set name(String value) => _name = value;`.

### Explicit get and set keywords:

- You can define custom getters and setters using the `get` and `set` keywords.
- This is useful for:
  - **Validation:** Ensuring data meets certain criteria before being set.
  - **Computed Properties:** Calculating a value based on other properties rather than storing it directly.
  - **Side Effects:** Performing additional actions when a property is accessed or modified.
  - **Read-only/Write-only properties:** By providing only a getter or only a setter.

**Code Sample:**

```dart
// 6.5 Getters and Setters

getter_setter.dart

```

## 6.6 Encapsulation
**Explanation:**  
Encapsulation is one of the fundamental principles of Object-Oriented Programming (OOP). It refers to the bundling of data (attributes) and methods (functions) that operate on the data within a single unit, which is a class. It also involves restricting direct access to some of the object's components, preventing unintended external interference and misuse of the data.

In Dart, encapsulation is achieved primarily through the use of the underscore (_) prefix for private members.

### Private members (_ prefix):

- In Dart, there is no public, private, or protected keyword like in some other languages (e.g., Java, C++).
- Instead, visibility is determined by the _ (underscore) prefix. Any variable, function, or class member (property or method) whose name starts with an underscore is private to its library (meaning the .dart file it's declared in).
- This means it can only be accessed within the same .dart file where it is declared. It is not truly private to the class, but private to the file (library). This is an important distinction in Dart.

### Controlling access to class members:

- By making instance variables private (_fieldName), you prevent direct modification from outside the library.
- You then provide public methods (getters and setters) to control how these private variables are accessed and modified. This allows you to add validation, logging, or other logic before data is read or written.

**Code Sample:**

```dart
// 6.6 Encapsulation

encapsulation.dart

```

## 6.7 Inheritance
**Explanation:**  
Inheritance is a fundamental OOP concept that allows a class to inherit properties and methods from another class. The class that inherits is called the subclass (or derived class, child class), and the class from which it inherits is called the superclass (or base class, parent class). Inheritance promotes code reusability and establishes an "is-a" relationship (e.g., a Dog is a Animal).

### extends keyword:

- Used to indicate that a class is inheriting from another class. A class can only extend one other class (single inheritance).

### Superclass and Subclass:

- **Superclass:** The class whose members are inherited.
- **Subclass:** The class that inherits members from the superclass. It can add new members or override inherited ones.

### Method Overriding (@override annotation):

- Subclasses can provide their own implementation for a method that is already defined in its superclass. This is called method overriding.
- The `@override` annotation is optional but highly recommended. It tells the Dart analyzer that you intend to override a method, helping to catch errors if the superclass method signature changes or if you accidentally misspell the method name.

### super keyword (calling superclass constructor/methods):

- The `super` keyword is used within a subclass to refer to the superclass.
- **Calling Superclass Constructor:** A subclass constructor must call one of its superclass's constructors. This is typically done implicitly if the superclass has a default constructor, or explicitly using `super()` or `super.namedConstructor()` in the initializer list of the subclass constructor.
- **Calling Superclass Methods:** You can use `super.methodName()` to call an overridden method from the superclass within the subclass's overridden method.

**Code Sample:**

```dart
// 6.7 Inheritance

inheritance.dart

```

## 6.8 Polymorphism
**Explanation:**  
Polymorphism, meaning "many forms," is the ability of an object to take on many forms. In object-oriented programming, it allows objects of different classes to be treated as objects of a common superclass. This means a single variable can refer to objects of different types, and a single method call can behave differently depending on the actual type of the object at runtime.

### Definition and examples:

- Polymorphism is often demonstrated through method overriding (as seen in inheritance) and through type casting.
- The key idea is that you can write code that operates on a base type, and that code will correctly execute the specialized behavior of any derived type.

### Runtime polymorphism:

- Dart supports runtime polymorphism. This means that the specific method implementation to be called is determined at runtime, based on the actual type of the object, not the declared type of the variable.
- This is crucial for flexible and extensible designs, allowing you to add new subclasses without modifying existing code that operates on the base class.

**Code Sample:**

```dart
// 6.8 Polymorphism

polymorphism.dart

```

## 6.9 Abstract Classes
**Explanation:**  
An abstract class is a class that cannot be instantiated directly. It serves as a blueprint for other classes, often defining common behaviors or properties that its subclasses must implement. Abstract classes can have both abstract methods (without implementation) and concrete methods (with implementation).

### abstract keyword:

- Used to declare a class as abstract.
- You cannot create an object of an abstract class using `new` or `ClassName()`.

### Abstract methods (no implementation):

- Methods declared in an abstract class without a body (no curly braces `{}`).
- Subclasses that extend an abstract class must provide an implementation for all inherited abstract methods, unless the subclass itself is also abstract.

### Cannot be instantiated directly:

- You can only create instances of concrete (non-abstract) subclasses that extend the abstract class.

**Code Sample:**

```dart
// 6.9 Abstract Classes

abstraction.dart

```

## 6.10 Interfaces: Implicit, Explicit (interface), and Pure (abstract interface)
**Explanation:**  
In Dart, the concept of an interface has evolved. Historically, every class implicitly defined an interface. With Dart 3.0, the language introduced explicit class modifiers, including `interface` and `abstract interface`, to provide more explicit control over how classes can be used as interfaces and how their contracts are enforced.

### Implicit Interfaces :

- Every class in Dart automatically defines an interface with the same name, containing all its public members (methods, getters, setters, instance variables).
- When a class implements another class, it's essentially agreeing to implement all the public members of that class's implicit interface.
- This is distinct from `extends`, where a class inherits the implementation. With `implements`, you only inherit the contract (the method signatures), not the implementation, and you must provide your own.

### The interface Modifier (Dart 3.0+):

- To define an interface, use the interface modifier. Libraries outside of the interface's own defining library can implement the interface, but not extend it
- It can't be inherited.
- It can be implemented
- It can be constructed.

### The abstract interface Modifier (Dart 3.0+):

- The `abstract interface` combination defines a "pure interface."
- A class marked `abstract interface` cannot be instantiated directly (like any abstract class).
- Any class that implements an abstract interface class must provide concrete implementations for all of its members (both abstract and concrete members defined in the abstract interface class).
- This is the closest Dart comes to the traditional "interface" concept found in languages like Java, where interfaces define a contract without providing any implementation.

**Code Sample:**

```dart
// 6.10 Interfaces: Implicit, Explicit (`interface`), and Pure (`abstract interface`)

interfaces.dart

```

## 6.11 Mixins
**Explanation:**  
Mixins in Dart are a way of reusing code in multiple class hierarchies. They provide a mechanism to add functionality to a class without using traditional inheritance. A mixin is essentially a class that can be "mixed in" with other classes to extend their capabilities.

### mixin keyword:

- Used to define a mixin. A mixin cannot be instantiated on its own and cannot have constructors.
- It can contain methods, getters, setters, and instance variables.

### Reusing code across class hierarchies:

- Mixins are particularly useful when you want to share a set of behaviors among classes that don't share a common superclass, or when you want to avoid the complexities of deep inheritance hierarchies.

### with keyword:

- Used to apply a mixin to a class. A class can `with` multiple mixins.
- The mixin's members are added to the class as if they were declared directly in the class.

### Restrictions and best practices for mixins:

- **No Constructors:** Mixins cannot declare constructors.
- **No extends clause:** A mixin cannot extend another class. It can, however, implement other classes (interfaces) or `on` another class (to restrict which classes can use it).
- **on keyword:** A mixin can specify that it can only be used on classes that extend or implement a certain type. This is done using the `on` keyword (e.g., `mixin Logger on Animal { ... }`).
- **Order Matters:** If multiple mixins or the class itself define members with the same name, the rightmost mixin (or the class itself) in the `with` clause takes precedence.
- **Abstract Methods:** Mixins can define abstract methods, which must then be implemented by the class that uses the mixin.

**Code Sample:**

```dart
// 6.11 Mixins

mixins.dart

```
