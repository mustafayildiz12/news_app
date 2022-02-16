import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsDeneme extends StatefulWidget {
  const TtsDeneme({Key? key}) : super(key: key);

  @override
  _TtsDenemeState createState() => _TtsDenemeState();
}

class _TtsDenemeState extends State<TtsDeneme> {
  FlutterTts flutterTts = FlutterTts();

  Future _speak() async {
    await flutterTts.setLanguage("tr-TR");

    await flutterTts.setSpeechRate(0.6);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);
    await flutterTts.speak("Evim güzel evim");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.indigo, borderRadius: BorderRadius.circular(12)),
            child: ElevatedButton(
              onPressed: () {
                _speak();
              },
              child: Text("Speak"),
            ),
          ),
        ),
      ),
    );
  }
}
