import 'package:flutter_tts/flutter_tts.dart';

/* Singleton Text-To-Speech Instance */
class TextToSpeech{
  //TTS Object
  static FlutterTts tts = FlutterTts();
  //Function for initializing tts object
  static initTTS(){
    tts.setLanguage("en-US");
    tts.setPitch(1.2);
    tts.setSpeechRate(0.7);
    tts.setVolume(1);
  }
  //Function for speaking
  static speak(String text) async{
    tts.setStartHandler((){
    });
    await tts.awaitSpeakCompletion(true);
    tts.speak(text);
  }
}
