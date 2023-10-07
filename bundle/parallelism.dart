// import 'dart:isolate';

// void main() async {
//   final numbers = [1, 2, 3, 4, 5];
//   final isolateCount = numbers.length;
//   final receivePort = ReceivePort();
//   final results = <int>[];

//   for (int i = 0; i < isolateCount; i++) {
//     await Isolate.spawn(
//         calculateSquare, {'number': numbers[i], 'port': receivePort.sendPort});
//   }

//   await for (final result in receivePort) {
//     results.add(result);
//     if (results.length == isolateCount) {
//       print("Squared numbers: $results");
//       receivePort.close();
//     }
//   }
// }

// void calculateSquare(Map<String, dynamic> data) {
//   final int number = data['number'];
//   final SendPort sendPort = data['port'];

//   final result = number * number;
//   sendPort.send(result);
// }
// void main() {
//   final numbers = [1, 2, 3, 4, 5];
//   final results = <int>[];

//   for (final number in numbers) {
//     final result = calculateSquare(number);
//     results.add(result);
//   }

//   print("Squared numbers: $results");
// }

// int calculateSquare(int number) {
//   return number * number;
// }
// import 'dart:isolate';

// void main() async {
//   final numbers =
//       List.generate(10000, (index) => index + 1); // A larger dataset
//   final isolateCount = numbers.length;
//   final receivePort = ReceivePort();
//   final results = <int>[];

//   final startTime = DateTime.now();

//   for (int i = 0; i < isolateCount; i++) {
//     await Isolate.spawn(
//         calculateSquare, {'number': numbers[i], 'port': receivePort.sendPort});
//   }

//   await for (final result in receivePort) {
//     results.add(result);
//     if (results.length == isolateCount) {
//       final endTime = DateTime.now();
//       final duration = endTime.difference(startTime);
//       print(
//           "Squared ${numbers.length} numbers in ${duration.inMilliseconds} ms.");
//       receivePort.close();
//     }
//   }
// }

// void calculateSquare(Map<String, dynamic> data) {
//   final int number = data['number'];
//   final SendPort sendPort = data['port'];

//   final result = number * number;
//   sendPort.send(result);
// }
void main() {
  final numbers =
      List.generate(10000, (index) => index + 1); // A larger dataset
  final results = <int>[];

  final startTime = DateTime.now();

  for (final number in numbers) {
    final result = calculateSquare(number);
    results.add(result);
  }

  final endTime = DateTime.now();
  final duration = endTime.difference(startTime);

  print("Squared ${numbers.length} numbers in ${duration.inMilliseconds} ms.");
}

int calculateSquare(int number) {
  return number * number;
}
