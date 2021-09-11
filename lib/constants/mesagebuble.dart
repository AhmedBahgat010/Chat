
import 'package:flash_chat/screens/user.dart';
import 'package:flutter/material.dart';

class MessageBunle extends StatelessWidget {
  MessageBunle({@required this.text, this.send, this.isMe});

  final String text;

  final String send;

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => User(emil:send,)
                    ),
                  );
            },
            child: Text(
              send,
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(30),
            color: isMe ? Colors.lightBlue : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(text,
                  style: TextStyle(
                      fontSize: 20, color: isMe ? Colors.white : Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
