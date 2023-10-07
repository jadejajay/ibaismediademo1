import 'dart:async';

Future<void> main() async {
  final lock = Lock(); // Custom lock

  await lock.acquire();
  try {
    // Critical section: Access shared resource
    await performTask();
  } finally {
    lock.release();
  }
}

class Lock {
  bool _locked = false;
  final _completer = Completer<void>();

  Future<void> acquire() async {
    while (_locked) {
      await _completer.future;
    }
    _locked = true;
  }

  void release() {
    if (_locked) {
      _locked = false;
      _completer.complete();
    }
  }
}

Future<void> performTask() async {
  // Simulate some asynchronous work
  await Future.delayed(Duration(seconds: 2));
  print("Task completed.");
}
