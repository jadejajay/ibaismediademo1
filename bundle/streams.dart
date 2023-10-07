// // import 'dart:async';

// // void main() {
// //   final myStream =
// //       Stream<int>.periodic(Duration(seconds: 1), (count) => count + 1)
// //           .take(5); // Example stream that emits 5 values.

// //   final subscription = listenToStream(myStream);

// //   // Continue with other tasks if needed.

// //   // After some time, you can cancel the subscription to stop listening.
// //   // Future.delayed(Duration(seconds: 3), () {
// //   //   subscription.cancel();
// //   // });
// // }

// // StreamSubscription<int> listenToStream(Stream<int> stream) {
// //   return stream.listen(
// //     (data) {
// //       print("Received: $data");
// //     },
// //     onError: (error) {
// //       print("Error: $error");
// //     },
// //     onDone: () {
// //       print("Stream is done.");
// //     },
// //     cancelOnError: true, // Automatically cancel subscription on error.
// //   );
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SSE Example',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final StreamController<String> _sseStreamController =
//       StreamController<String>();

//   @override
//   void initState() {
//     super.initState();
//     _connectToSSEStream();
//   }

//   Future<void> _connectToSSEStream() async {
//     final sseUrl =
//         'https://your-remote-server.com/sse.php'; // Replace with your SSE endpoint URL

//     final response = await http.get(Uri.parse(sseUrl));

//     if (response.statusCode == 200) {
//       final client = http.ByteStream(response.stream);
//       final sseStream = client.transform(utf8.decoder).asBroadcastStream();
//       sseStream.listen((event) {
//         _sseStreamController.add(event);
//       });
//     } else {
//       throw Exception('Failed to connect to SSE stream');
//     }
//   }

//   @override
//   void dispose() {
//     _sseStreamController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SSE Example'),
//       ),
//       body: Center(
//         child: StreamBuilder<String>(
//           stream: _sseStreamController.stream,
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }

//             if (!snapshot.hasData) {
//               return CircularProgressIndicator();
//             }

//             final sseData = snapshot.data;

//             return Text('SSE Data: $sseData');
//           },
//         ),
//       ),
//     );
//   }
// }
