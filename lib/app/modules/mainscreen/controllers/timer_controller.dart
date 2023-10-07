import 'dart:async';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  late Timer _timer;
  final Rx<Duration> _remainingTime = Rx<Duration>(Duration.zero);
  Function onFinish = () => {};

  Duration get remainingTime => _remainingTime.value;

  CountdownController(Duration duration, this.onFinish) {
    _remainingTime.value = duration;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.value.inSeconds > 0) {
        _remainingTime.value =
            _remainingTime.value - const Duration(seconds: 1);
      } else {
        _timer.cancel();
        onFinish();
        // You can add any logic here for when the countdown finishes.
      }
    });
  }

  void restart(Duration duration) {
    _timer.cancel();
    _remainingTime.value = duration;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
