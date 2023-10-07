// import 'package:flutter/material.dart';

// class TexturedText3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Masked on Text Example',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Image Masked on Text Example')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               MaskedImageOnText(
//                 text: 'Hello, Masked Image!',
//                 imagePath:
//                     'assets/mask_image.png', // Replace with your image path
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MaskedImageOnText extends StatelessWidget {
//   final String text;
//   final String imagePath;

//   MaskedImageOnText({required this.text, required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.transparent,
//           ),
//         ),
//         ClipPath(
//           clipper: TextMaskClipper(
//             text: text,
//             textDirection: TextDirection.ltr,
//           ),
//           child: Image.asset(imagePath, fit: BoxFit.cover),
//         ),
//       ],
//     );
//   }
// }

// class TextMaskClipper extends CustomClipper<Path> {
//   final String text;
//   final TextDirection textDirection;

//   TextMaskClipper({required this.text, required this.textDirection});

//   @override
//   Path? getClip(Size size) {
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: const TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       textDirection: textDirection,
//     );

//     textPainter.layout(minWidth: 0, maxWidth: size.width);
//     return null;

//     // return textPainter.computePath(Offset.zero);
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
