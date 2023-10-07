import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

/// A class that holds [Preference] objects for the common values that you want
/// to store in your app. This is *not* necessarily needed, but it makes your
/// code more neat.
///
/// (In a real app you'd want to use an [InheritedWidget] to pass this around).
class MyAppSettings {
  MyAppSettings(StreamingSharedPreferences preferences)
      : counter = preferences.getInt('counter', defaultValue: 0),
        darkMode = preferences.getBool('darkMode', defaultValue: false);

  final Preference<int> counter;
  final Preference<bool> darkMode;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain instance to streaming shared preferences, create MyAppSettings, and
  // once that's done, run the app.
  final preferences = await StreamingSharedPreferences.instance;
  final settings = MyAppSettings(preferences);

  runApp(MyApp(settings));
}

class MyApp extends StatelessWidget {
  MyApp(this.settings);
  final MyAppSettings settings;

  @override
  Widget build(BuildContext context) {
    // Preference is a Stream - it can be used directly with a StreamBuilder
    // widget. We're using a PreferenceBuilder which removes the need to provide
    // the `initialData` parameter.
    //
    // PreferenceBuilder will call its `builder` method with the latest value
    // whenever the value has updates.
    return PreferenceBuilder<bool>(
      preference: settings.darkMode,
      builder: (BuildContext context, bool darkMode) {
        final brightness = darkMode ? Brightness.dark : Brightness.light;

        return MaterialApp(
          title: 'StreamingSharedPreferences Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: brightness, // Pass the brightness value here
          ),
          home: MyHomePage(settings),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage(this.settings);
  final MyAppSettings settings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamingSharedPreferences'),
        actions: [
          IconButton(
            icon: Icon(Icons.palette),
            onPressed: () {
              // Obtain the current value synchronously by calling getValue()...
              bool currentValue = settings.darkMode.getValue();

              // ...and update the value by inverting it.
              //
              // This is identical to preferences.setBool('darkMode', !currentValue),
              // but this syntax is more convenient.
              settings.darkMode.setValue(!currentValue);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),

            // Rebuild the Text widget with a new value every time "counter"
            // has a new value.
            PreferenceBuilder<int>(
              preference: settings.counter,
              builder: (BuildContext context, int counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Obtain the current counter value synchronously...
          final currentCounter = settings.counter.getValue();

          // ...and add one to the existing value and update it.
          settings.counter.setValue(currentCounter + 1);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}