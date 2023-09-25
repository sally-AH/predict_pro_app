import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  void initState() {
    super.initState();
    final Uri url = Uri.parse("http://192.168.0.104:8000/api/getcategories");
    http.get(url,).then((value) {
      print(value.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock"),
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
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (ctx, index) {
              return Container(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StockPage()));
                  },
                  title: Text("Product Name"),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/200/300"),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              );
            }),
      ),
    );
  }
}
