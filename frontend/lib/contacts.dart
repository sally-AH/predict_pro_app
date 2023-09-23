import 'package:flutter/material.dart';
import 'package:predict_pro/chat.dart';
class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
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
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Chats",),
                Tab(text: "Contacts",),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 25,right: 10, bottom: 30),
                child: Container(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (ctx, index){
                        return Container(
                          child:  ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage())
                              );},
                            title: Text("Mohammad Salah"),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))
                              )
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 25,right: 10, bottom: 30),
                child: Container(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (ctx, index){
                        return Container(
                          child:  ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage())
                              );},
                            title: Text("Mohammad Salah"),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))
                              )
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        )
      ),
    );


  }
}

