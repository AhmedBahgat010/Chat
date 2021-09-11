import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants/button.dart';

import 'package:flash_chat/constants/textfield.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static String id = "login";


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool modal_progress_hud = false;
  String email;
  String password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:ModalProgressHUD(
        inAsyncCall: modal_progress_hud
        ,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                height: 199.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Textfield_Constamts(
                text: 'Enter your email',
                obscureText: false,
                onChanged: (value) {
                  email = value;
                }),
            SizedBox(
              height: 8.0,
            ),
            Textfield_Constamts(

                text: " Enter your password.",
                obscureText: true,

                onChanged: (value) {
                  password = value;
                    }),
            SizedBox(
              height: 24.0,
            ),
            Button(
              text: "Log in",

           onPressed: () async {
             setState(() {
               modal_progress_hud = true;
             });
                try{
                 final userLog =await _auth.signInWithEmailAndPassword(email: email, password: password);
                 if (userLog != null) {
                   Navigator.pushNamed(context, ChatScreen.id);
                 }
                 setState(() {
                   modal_progress_hud = false;
                 });
                } catch (e) {
                  print(e);
                }

           },
              color: Color(0xffc33116),

            ),
          ],
        ),
      ),
      ));
  }
}
