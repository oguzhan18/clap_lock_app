import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  runApp(MyApp());
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  Workmanager().registerOneOffTask(
    "1",
    "simpleTask",
    inputData: <String, dynamic>{},
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    ClapDetectionService().startListening();
    return Future.value(true);
  });
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
      // Burada alkış algılandığında telefon kilitlenecek
      print("Alkış algılandı: $event");
      lockDevice();
    });
  }

  void stopListening() async {
    await _recorder.stopRecorder();
    await _recorder.closeAudioSession();
    await _audioStreamController.close();
  }
}

void lockDevice() {
}
