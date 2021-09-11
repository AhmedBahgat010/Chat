import 'package:flash_chat/constants/button.dart';

import 'package:flash_chat/constants/textfield.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool modal_progress_hud =false;
  String email;
  String password;
  String name;
  String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: modal_progress_hud,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 200,
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),

              Textfield_Constamts(
                  text: " Enter your Name ",
                  obscureText: false,
                  onChanged: (value) {
                    name = value;
                  }),
              SizedBox(
                height: 8.0,
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
                height: 8.0,
              ),
              Textfield_Constamts(
                  text: " Enter your Age",
                  obscureText: false,
                  onChanged: (value) {
                    age = value;
                  }),
              SizedBox(
                height: 24.0,
              ),
              Button(
                text: "Registraion",
                onPressed: () async {

                    MaterialPageRoute(
                        builder: (context) => User(age: age,name: name,)
                    );

                  setState(() {
                    modal_progress_hud =true;
                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password, );
                    if (newuser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      modal_progress_hud=false;
                    });
                  } catch (e) {
                    print(e);
                  }

                  // print(password);
                  // print(email);
                },
                color: Color(0xf2cf5436),              ),
            ],
          ),
        ),
      ),
    );
  }
}
