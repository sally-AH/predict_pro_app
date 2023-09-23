import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMessage = '';
  void _sendMessage(){
    FirebaseFirestore.instance
        .collection('chats/gZzzNqCqCV5gT5oGyzYR/messages')
        .add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': 1,
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'type a message...',
                ),
                onChanged: (value){
                  setState(() {
                    _enteredMessage = value;
                  });
                },
              ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.send,
              ),
            onPressed: _enteredMessage.trim().isEmpty?null:_sendMessage,
          )
        ],
      ),
    );
  }
}
