import 'dart:developer';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:e_osary/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:shared_preferences/shared_preferences.dart';

class RosaryView extends StatefulWidget {
  const RosaryView({super.key});

  @override
  State<RosaryView> createState() => _RosaryViewState();
}

class _RosaryViewState extends State<RosaryView> {
  bool isListening = false;
  late stt.SpeechToText _speechToText;
  String text = 'Press the button & start speaking';
  int counter = 0;

  final List<String> targetPhrases = [
    "subhanallah",
    "Savannahlaw",
    "allahhuakbar",
    "Allah hu Akbar",
    "allahuakbar",
    "alhamdulilah",
    "سبحانالله",
    "اللهأكبر",
  ];

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
    _loadCounter();
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
    _saveCounter();
  }

  Future<void> _saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
    log("Counter saved: $counter");
  }

  Future<void> _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
    log("Counter loaded: $counter");
  }

  void _captureVoice() async {
    if (!isListening) {
      bool listen = await _speechToText.initialize();
      if (listen) {
        setState(() {
          isListening = true;
        });

        _speechToText.listen(onResult: (result) {
          setState(() {
            text = result.recognizedWords;
            String normalizedText = text.replaceAll(' ', '').toLowerCase();
            log("Recognized words: $normalizedText");

            if (_matchesAnyTargetPhrase(normalizedText)) {
              log("Match found for: $normalizedText");
              _incrementCounter();
            } else {
              log("No match found for: $normalizedText");
            }
          });
        });
      }
    } else {
      setState(() {
        isListening = false;
        _speechToText.stop();
      });
    }
  }

  bool _matchesAnyTargetPhrase(String text) {
    return targetPhrases.any((phrase) => text == phrase);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Rosary',
        backgroundColor: Colors.transparent,
        fontSize: 26,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _captureVoice,
          child: Icon(
            isListening ? Icons.mic : Icons.mic_none,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.5),
            Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  counter.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
