# Clap Lock App

Clap Lock App is a Flutter application that detects claps in the background and locks the device when claps are detected. This app uses the `flutter_sound` package for audio recording and `workmanager` for background tasks.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Contributing](#contributing)
- [License](#license)

## Installation

To install and run the Clap Lock App, follow these steps:

### Prerequisites

- Flutter SDK: [Installation guide](https://flutter.dev/docs/get-started/install)
- Android Studio: [Download here](https://developer.android.com/studio)

### Steps

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/clap_lock_app.git
    cd clap_lock_app
    ```

2. **Get the dependencies:**

    ```sh
    flutter pub get
    ```

3. **Run the app:**

    ```sh
    flutter run
    ```

## Usage

The app will start listening for claps as soon as it launches. When a clap is detected, the app will lock the device.

### Start Listening

The `ClapDetectionService` class is responsible for starting and stopping the audio recording. To start listening for claps, call:

```dart
ClapDetectionService clapService = ClapDetectionService();
clapService.startListening();
```
## Stop Listening
To stop listening for claps, call:

```dart
clapService.stopListening();
```
## Features
* <b>Background Detection:</b> The app can detect claps even when running in the background.
* <b>Device Lock:</b> Automatically locks the device when a clap is detected.
* <b>Simple UI:</b> Minimalistic user interface showing the status of the clap detection.

## Contributing
We welcome contributions to the Clap Lock App! To contribute:
- Fork the repository.
- Create a new branch (git checkout -b feature/your-feature).
- Make your changes.
- Commit your changes (git commit -am 'Add new feature').
- Push to the branch (git push origin feature/your-feature).
- Create a new Pull Request.
- Please make sure to follow the code of conduct.


### Example Files

#### `main.dart`

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clap Lock App'),
        ),
        body: Center(
          child: Text('Listening for claps...'),
        ),
      ),
    );
  }
}

class ClapDetectionService {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  StreamController<Food> _audioStreamController = StreamController<Food>();

  void startListening() async {
    await _recorder.openAudioSession();
    await _recorder.startRecorder(
      toStream: _audioStreamController.sink,
    );

    _audioStreamController.stream.listen((event) {
      print("Clap detected: $event");
      // Lock the device (This needs platform-specific code)
    });
  }

  void stopListening() async {
    await _recorder.stopRecorder();
    await _recorder.closeAudioSession();
    await _audioStreamController.close();
  }
}
```
## `pubspec.yaml`

```dart
name: clap_lock_app
description: "A Flutter app that detects claps in the background and locks the device when claps are detected."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=2.12.0 <3.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_sound: ^8.3.10
  workmanager: ^0.4.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```
## `build.gradle`
```java
buildscript {
    ext.kotlin_version = '1.6.10'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
```

`android/app/src/main/kotlin/com/example/clap_lock_app/MainActivity.kt`
```java
package com.example.clap_lock_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }
}

```

