import 'dart:ffi';

import 'package:flash_chat/constants/mesagebuble.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
FirebaseUser loginuser;

class ChatScreen extends StatefulWidget {
  static String id = "cat";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textEditingController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gitcreatuser();
  }

  void gitcreatuser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loginuser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Row(
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 40,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'CAT Reloaded Chat',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('message').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final messages = snapshot.data.documents;
                  List<MessageBunle> messageWidgets = [];
                  for (var message in messages) {
                    final messageSend = message.data['Send'];
                    final messageText = message.data['Text'];
                    final currentuser = loginuser.email;
                    if (currentuser == messageSend) {}
                    final messageWidget = MessageBunle(
                      text: messageText,
                      send: messageSend,
                      isMe: currentuser == messageSend,
                    );
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                      child: ListView(
                       // reverse: true,
                    padding: EdgeInsets.all(20),
                    children: messageWidgets,
                  ));
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      controller: textEditingController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textEditingController.clear();
                      _firestore.collection('message').add({
                        "Text": message,
                        "Send": loginuser.email,
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
