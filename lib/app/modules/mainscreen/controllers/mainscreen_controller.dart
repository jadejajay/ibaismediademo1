import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibaismedia/app/modules/mainscreen/views/home_view.dart';
import 'package:ibaismedia/app/modules/mainscreen/views/profile_view.dart';

class MainscreenController extends GetxController {
  String searchValue = '';
  var currentParameter = 1.obs;
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  Future<List<String>> fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  // Function to load a widget based on the current parameter value
  Widget loadWidget() {
    switch (currentParameter.toInt()) {
      case 1:
        return HomePage();
      case 2:
        return ImageWidget(parameter: currentParameter.toInt());
      case 3:
        return AnotherWidget(parameter: currentParameter.toInt());
      case 10:
        return const ProfileView();
      default:
        return const Text('Invalid Parameter');
    }
  }
}

class TextWidget extends StatelessWidget {
  final int parameter;

  const TextWidget({super.key, required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Text('Text Widget - Parameter: $parameter');
  }
}

class ImageWidget extends StatelessWidget {
  final int parameter;

  ImageWidget({required this.parameter});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        'assets/images/placeholder.png'); // Replace with your image
  }
}

class AnotherWidget extends StatelessWidget {
  final int parameter;

  AnotherWidget({required this.parameter});

  @override
  Widget build(BuildContext context) {
    print("widget3 called");
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Another Widget - Parameter: $parameter'),
      ),
    );
  }
}
