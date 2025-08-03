# Module 7: Asynchronous Programming

## 7.1 Understanding Asynchrony

**Explanation:**  
Asynchronous programming is crucial for building responsive and efficient applications, especially in UI development (Flutter), network communication, and file I/O. In synchronous programming, tasks execute one after another, blocking the program when a long-running operation occurs. Asynchronous programming lets operations run in the background.

**Why do we need asynchronous programming?**

- **UI Responsiveness:** Prevents UI freezing during long operations.
- **Network Requests:** Handles network latency without blocking the app.
- **File I/O:** Performs time-consuming file operations asynchronously.
- **Performance:** Allows I/O-bound tasks to run concurrently despite Dart being single-threaded.

**Event Loop and Isolates (brief introduction):**
- **Event Loop:** Processes callbacks from an event queue.
- **Isolates:** Allow true concurrency without shared memory. (See Module 13 for more.)

## 7.2 Futures

**Explanation:**  
A Future represents a value or error that will be available later. It can be uncompleted, completed with a value, or completed with an error.

**Code Sample:**

```dart
// 7.2 Futures

futures.dart

```

## 7.3 async and await

**Explanation:**  
The `async` and `await` keywords make asynchronous code easier to read by letting it look like synchronous code.

**Code Sample:**

```dart
// 7.3 `async` and `await`

async_and_await.dart

```

## 7.4 Error Handling with Futures

**Explanation:**  
Error handling in asynchronous code is managed with try-catch blocks (or chained error handlers) to catch exceptions in awaited functions.

**Code Sample:**

```dart
// 7.4 Error Handling with Futures

error_handling_with_futures.dart

```

## 7.5 Streams (Basics)

**Explanation:**  
A Stream represents a sequence of asynchronous events (data or errors) over time. Streams can be created from Iterables, periodic generators, and more. Listeners subscribe to streams to process events, and subscriptions can be controlled (paused, resumed, canceled).

**Code Sample:**

```dart
// 7.5 Streams (Basics)

streams_basic.dart

```
