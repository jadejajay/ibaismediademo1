import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ibaismedia/app/modules/loginscreen/views/auth_view.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  const LoginscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LoginscreenView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: LoginPage(),
      ),
    );
  }
}
