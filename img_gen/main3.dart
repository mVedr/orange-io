import 'package:flutter/material.dart';
import 'package:contact_state_app/img_gen/homescreen.dart';

//void main(){
 // runApp(MyApp());
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen2(),

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,

      ),
    );
  }
}
