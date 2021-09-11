import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants/button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "Welcom_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
// Animation animation;
// @override
//   void initState(){
//   super.initState();
//   controller=AnimatedContainer() as An// AnimationController  controller;imationController ;
//   animation =CurvedAnimation( parent: controller ,curve: Curves.easeIn);
//   controller.forward();
//   controller.addListener((){
//     setState(() {
//       print(animation.value);
//     });
//   });
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TypewriterAnimatedTextKit(
                  text: [
                    'CAT Reloaded Chat',
                  ],
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Button(
              text: "Log in",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Color(0xffc33116),
            ),
            Button(
              text: "Registraion",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Color(0xf2cf5436),
            ),
          ],
        ),
      ),
    );
  }
}
