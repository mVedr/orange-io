import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
             // image: DecorationImage(
              //  image: AssetImage('https://lh3.googleusercontent.com/ogw/AOh-ky3jsoEutAKKqEPRKSn3fNxHtUwjsIWw9AdEKnvH=s64-c-mo'),
             // ),
            ),
          ),
          SizedBox(
            height: 130,
            child: Image.asset("assets/download3.jpg", fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}