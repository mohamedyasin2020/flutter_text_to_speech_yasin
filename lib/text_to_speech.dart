import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  TextEditingController textEditingController = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text To Speech"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "Enter text here",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  _speak(textEditingController.text);
                }
              },
              child: const Icon(Icons.volume_up, color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.blue, // Button color
                backgroundColor: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.speak(text);
  }
}
