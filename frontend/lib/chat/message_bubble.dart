import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isMe);

  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end:MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: isMe? Theme.of(context).primaryColor: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.only(
                topLeft: !isMe? Radius.circular(0):Radius.circular(12),
                topRight: isMe? Radius.circular(0):Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),

              )
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
