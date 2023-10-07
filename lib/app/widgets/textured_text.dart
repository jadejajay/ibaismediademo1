import 'package:flutter/material.dart';

class TexturedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text with Texture Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Text with Texture Example')),
        body: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              // Create a gradient or other shader here
              return const LinearGradient(
                colors: [Colors.red, Colors.blue],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: const Text(
              'Hello, Texture!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
