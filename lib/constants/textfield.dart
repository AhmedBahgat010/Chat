import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield_Constamts extends StatefulWidget {
  Textfield_Constamts({@required this.text, this.obscureText, this.onChanged,this.icon,this.onPressed});

  final String text;

  final bool obscureText;
  final Function onChanged;
  final Function onPressed;
  final Icon icon;

  @override
  _Textfield_ConstamtsState createState() => _Textfield_ConstamtsState();
}

class _Textfield_ConstamtsState extends State<Textfield_Constamts> {



  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
      //   suffixIcon: IconButton(
      //      icon: widget.icon, onPressed: widget.onPressed,
      // ),
        hintText: widget.text,
        hintStyle: TextStyle(
          color: Color(0xffc33116),
          fontSize: 20,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),

    );
  }
}
