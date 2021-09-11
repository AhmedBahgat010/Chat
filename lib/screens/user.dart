
import 'dart:math';

import 'package:flash_chat/constants/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User extends StatelessWidget {
  User({this.emil,this.age,this.name});
  final String emil;
  final String name;
  final String age;
  static String id = "user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 110,
            backgroundImage: AssetImage('assets/aya3.png'),
          ),
          SizedBox(
            height: 10,
          ),
          card("Name: $name"),
          card("Email: $emil"),
          card('Age: $age'),

        ],
      ),
    );
  }
}
