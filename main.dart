import 'package:contact_state_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'kenny_speaks/tts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // WidgetsFlutterBinding.ensureInitialized();
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
      home: const LoginScreen(),
    );
  }
}