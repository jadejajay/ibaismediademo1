// import 'dart:isolate';

// void main() {
//   // Create and spawn an isolate
//   Isolate.spawn(isolateFunction, "Hello from main!");

//   // Main thread code continues to run
//   print("Hello from the main thread!");
// }

// void isolateFunction(String message) {
//   // Code to run in the isolate
//   print(message);
// }
// import 'dart:isolate';

// void main() async {
//   final receivePort = ReceivePort();

//   // Spawn an isolate and pass it the receive port
//   await Isolate.spawn(isolateFunction, receivePort.sendPort);

//   // Listen for messages from the isolate
//   receivePort.listen((message) {
//     print("Received message: $message");
//     receivePort.close(); // Close the receive port when done
//   });
// }

// void isolateFunction(SendPort sendPort) {
//   sendPort.send("Hello from isolate!");
// }
// import 'dart:isolate';

// void main() async {
//   final receivePort = ReceivePort();
//   const isolateCount = 3; // Number of isolates to spawn

//   // Spawn multiple isolates
//   for (int i = 0; i < isolateCount; i++) {
//     await Isolate.spawn(
//         isolateFunction, {'id': i, 'port': receivePort.sendPort});
//   }

//   // Listen for messages from isolates
//   receivePort.listen((message) {
//     print("Received message: $message");
//   });
// }

// void isolateFunction(Map<String, dynamic> data) {
//   final int id = data['id'];
//   final SendPort sendPort = data['port'];

//   // Simulate some work with a delay
//   Future.delayed(Duration(seconds: id * 2), () {
//     final message = "Isolate $id completed its work.";
//     sendPort.send(message);
//   });
// }
// void main() {
//   final taskCount = 3; // Number of tasks to perform

//   final stopwatch = Stopwatch()..start(); // Start a timer

//   for (int i = 0; i < taskCount; i++) {
//     performTask(i);
//   }

//   stopwatch.stop(); // Stop the timer when all tasks are done
//   print("All tasks completed in ${stopwatch.elapsedMilliseconds} ms.");
// }

// void performTask(int id) {
//   // Simulate some work with a delay
//   Future.delayed(Duration(seconds: id + 1), () {
//     print("Task $id completed its work.");
//   });
// }
// import 'dart:isolate';

// void main() async {
//   final receivePort = ReceivePort();
//   final isolateCount = 3; // Number of isolates to spawn

//   final stopwatch = Stopwatch()..start(); // Start a timer

//   // Spawn multiple isolates
//   for (int i = 0; i < isolateCount; i++) {
//     await Isolate.spawn(
//         isolateFunction, {'id': i, 'port': receivePort.sendPort});
//   }

//   // Listen for messages from isolates
//   final messagesReceived = <String>[];
//   receivePort.listen((message) {
//     messagesReceived.add(message);
//     if (messagesReceived.length == isolateCount) {
//       stopwatch.stop(); // Stop the timer when all isolates are done
//       print("All isolates completed in ${stopwatch.elapsedMilliseconds} ms.");
//     }
//   });
// }

// void isolateFunction(Map<String, dynamic> data) {
//   final int id = data['id'];
//   final SendPort sendPort = data['port'];

//   // Simulate some work with a delay
//   Future.delayed(Duration(seconds: id + 1), () {
//     final message = "Isolate $id completed its work.";
//     sendPort.send(message);
//   });
// }
import 'dart:async';
import 'dart:isolate';

void main() async {
  final taskCount = 3; // Number of tasks to perform
  final isolateCount = 3; // Number of isolates to spawn

  // Track time for tasks without isolates
  final stopwatchWithoutIsolates = Stopwatch()..start();

  // Without Isolates (Single-Threaded)
  for (int i = 0; i < taskCount; i++) {
    performTaskWithoutIsolates(i);
  }

  stopwatchWithoutIsolates.stop(); // Stop the timer

  print(
      "All tasks completed without isolates in ${stopwatchWithoutIsolates.elapsedMilliseconds} ms.");

  // Track time for tasks with isolates
  final stopwatchWithIsolates = Stopwatch()..start();

  // With Isolates (Multithreaded)
  final receivePort = ReceivePort();
  final messagesReceived = <String>[];

  // Spawn multiple isolates
  for (int i = 0; i < isolateCount; i++) {
    await Isolate.spawn(
        isolateFunction, {'id': i, 'port': receivePort.sendPort});
  }

  // Listen for messages from isolates
  receivePort.listen((message) {
    messagesReceived.add(message);
    if (messagesReceived.length == isolateCount) {
      stopwatchWithIsolates.stop(); // Stop the timer
      print(
          "All isolates completed in ${stopwatchWithIsolates.elapsedMilliseconds} ms.");
    }
  });

  // Perform additional tasks in the main thread (optional)
  for (int i = 0; i < taskCount; i++) {
    performTaskWithoutIsolates(i);
  }
}

void performTaskWithoutIsolates(int id) async {
  // Simulate some work with a delay
  await Future.delayed(Duration(seconds: id + 1));
  print("Task $id completed its work without isolates.");
}

void isolateFunction(Map<String, dynamic> data) {
  final int id = data['id'];
  final SendPort sendPort = data['port'];

  // Simulate some work with a delay
  Future.delayed(Duration(seconds: id + 1), () {
    final message = "Isolate $id completed its work with isolates.";
    sendPort.send(message);
  });
}
