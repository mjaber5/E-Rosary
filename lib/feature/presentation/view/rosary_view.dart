import 'package:avatar_glow/avatar_glow.dart';
import 'package:e_osary/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class RosaryView extends StatefulWidget {
  const RosaryView({super.key});

  @override
  State<RosaryView> createState() => _RosaryViewState();
}

class _RosaryViewState extends State<RosaryView> {
  bool isListening = false;

  late stt.SpeechToText _speechToText;
  String text = 'Press the button & start speaking ';
  double confidence = 1.0;
  int counter = 0;
  @override
  void initState() {
    _speechToText = stt.SpeechToText();
    super.initState();
  }

  void incrementCounter() {
    isListening ? counter++ : counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Rosary',
        backgroundColor: Colors.transparent,
        fontSize: 26,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _catureVoice,
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
                  (isListening ? counter++ : counter).toString(),
                  style: const TextStyle(
                    fontSize: 20,
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

  void _catureVoice() async {
    if (!isListening) {
      bool listen = await _speechToText.initialize();
      if (listen) {
        setState(() {
          isListening = true;
        });
        _speechToText.listen(onResult: (result) {
          setState(() {
            text = result.recognizedWords;
            if (result.hasConfidenceRating && result.confidence > 0) {
              confidence = result.confidence;
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
}
