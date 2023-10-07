// import 'package:example_nav2/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibaismedia/app/modules/splashscreen/controllers/splashscreen_controller.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'app/modules/splash/controllers/splash_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "Application",
      // binds: [
      //   Bind.put(SplashService()),
      //   Bind.put(AuthService()),
      // ],
      onInit: () =>
          //          Get.find<SplashController>().checkUser()
          // Get.find<SplashService>().init()
          Get.put(SplashscreenController()).init(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      // builder: (context, child) {
      //   return FutureBuilder<void>(
      //     key: ValueKey('initFuture'),
      //     future: Get.find<SplashService>().init(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return child ?? SizedBox.shrink();
      //       }
      //       return SplashView();
      //     },
      //   );
      // },
      // routeInformationParser: GetInformationParser(
      //     // initialRoute: Routes.HOME,
      //     ),
      // routerDelegate: GetDelegate(
      //   backButtonPopMode: PopMode.History,
      //   preventDuplicateHandlingMode:
      //       PreventDuplicateHandlingMode.ReorderRoutes,
      // ),
    ),
  );
}
