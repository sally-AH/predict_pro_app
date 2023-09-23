import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:predict_pro/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats/gZzzNqCqCV5gT5oGyzYR/messages').orderBy('createdAt', descending: true).snapshots(),
      builder: (ctx, chatSnapshot){
        if (chatSnapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        final documents = chatSnapshot.data?.docs;
        return ListView.builder(
          reverse: true,
            itemCount: documents?.length,
            itemBuilder: (ctx, index) => MessageBubble(
                documents?[index]['text'],
                documents?[index]['userId']==1
            )
        );
      },
    );
  }
}
