import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'dart:async';

import 'package:async/async.dart';
import 'package:ibaismedia/app/routes/app_pages.dart';
import 'package:ibaismedia/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

class SplashscreenController extends GetxService {
  final welcomeStr = ['Welcome to IBAIS MEDIA', 'Welcome to IBAIS MEDIA'];
  final activeStr = 0.obs;

  final memo = AsyncMemoizer<void>();
  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  Future<void> _initFunction() async {
    Timer t = Timer.periodic(const Duration(microseconds: 500), (timer) {
      if (activeStr.value == 0) {
        activeStr.value = 1;
      } else {
        activeStr.value = 0;
      }
    });
    //simulate some long running operation
    String storageLocation = (await getApplicationDocumentsDirectory()).path;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.useAuthEmulator('192.168.0.8', 9099);
    await FastCachedImageConfig.init(
        subDir: storageLocation, clearCacheAfter: const Duration(days: 15));
    //cancel the timer once we are done
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        t.cancel();
        Get.offNamed(Routes.LOGINSCREEN);
        print('User is currently signed out!');
      } else {
        t.cancel();
        Get.offNamed(Routes.MAINSCREEN);
        print('User is signed in!');
      }
    });
  }
}
