import 'package:contact_state_app/main2.dart';
import 'package:contact_state_app/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return "Please Enter Your Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
     // keyboardType: TextInputType.emailAddress,
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: (){
          signIn(emailController.text, passwordController.text);
        },
        minWidth: MediaQuery.of(context).size.width,
        color: Colors.deepOrange,
        child: const Text("Login" , style: TextStyle(color: Colors.white,fontSize: 017),),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orange.io',
          style: GoogleFonts.spaceMono(
            fontSize: 30,
            fontWeight: FontWeight.bold
          )
        ),

      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),

              child: Form(
                key: _formKey,
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Image.asset("assets/download.png",
                      fit: BoxFit.contain,
                      )
                    ),
                    const SizedBox(height: 45,),
                    emailField,const SizedBox(height: 45,),
                    passwordField,const SizedBox(height: 45,),
                    loginButton,const SizedBox(height: 15,),
                    Row(
                      children:<Widget> [
                        const Text("Don't Have An Account ?"),
                        GestureDetector(onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const RegistrationScreen()));
                        },
                        child: const Text(" Sign Up",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.deepOrange
                        ),),
                        ),

                      ],
                      mainAxisAlignment: MainAxisAlignment.center,

                    )
                  ]
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Login / Signin Function for the user
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      // Validating User Data through firebase
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage())),
        });
      } on FirebaseAuthException catch (error) {
        var errorMessage="hi";
        switch (error.code) {

          case "invalid-email":
             errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
