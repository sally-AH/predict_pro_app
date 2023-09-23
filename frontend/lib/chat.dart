import 'package:flutter/material.dart';
import 'package:predict_pro/chat/messages.dart';
import 'package:predict_pro/chat/new_message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages()
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}

