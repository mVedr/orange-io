import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{
  static FlutterTts tts = FlutterTts();
  static initTTS(){
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.setSpeechRate(0.7);
    tts.setVolume(1);

  }
  static speak(String text) async{
    tts.setStartHandler((){

    });
    await tts.awaitSpeakCompletion(true);
    tts.speak(text);
  }
}