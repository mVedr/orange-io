import 'package:contact_state_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'kenny_speaks/tts.dart';

Future<void> main() async {
  //Widget Binding Is Used For Initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  //Initializing Firebase
  await Firebase.initializeApp();
  //Initializing Text-To-Speech Package 
  TextToSpeech.initTTS();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      //User By Default Is Navigated To LoginScreen
      home: const LoginScreen(),
    );
  }
}
