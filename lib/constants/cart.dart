import 'package:flutter/material.dart';

Widget card(String text) {
  return Container(
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.all(10),
    width: 150,
    height: 65,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 189, 161, .3),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ]),
    child: Text(
      text,
      style: TextStyle(color: Colors.black87,
        fontSize: 25,
      ),
    ),
  );
}