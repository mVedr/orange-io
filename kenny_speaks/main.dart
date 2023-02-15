import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contact_state_app/kenny_speaks/speech_screen.dart';
import 'package:contact_state_app/kenny_speaks/tts.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  TextToSpeech.initTTS();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
   const MyApp({super.key});

   @override
  Widget build(BuildContext context){
     return MaterialApp(
       home: const SpeechScreen(),
       debugShowCheckedModeBanner: false,
       title: "Ask Kenny",
       theme: ThemeData(
         primarySwatch: Colors.orange
       ),

     );
   }
}