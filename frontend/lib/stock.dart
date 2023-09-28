import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:http/http.dart' as http;
import 'package:predict_pro/item.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'Models/category_model.dart';
import 'Models/item_model.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<Category> categories = [];
  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    final Uri url = Uri.parse("http://192.168.0.104:8000/api/getcategories");
    dynamic jsonRes = {};
    http.get(url).then((value) {
      jsonRes = jsonDecode(value.body);
      jsonRes.forEach((item) {
        Category cat = Category.fromJson(item);
        categories.add(cat);
      });
      setState(() {
        categories;
        print(jsonRes);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock"),
        leading: IconButton(
          onPressed: () {
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
            itemCount: categories.length, //categories.length
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin:
                      EdgeInsets.only(top: 15, right: 15, bottom: 10, left: 15),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(244, 244, 244, 100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed("/item", arguments: {
                        "items": items,
                      });
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Text(
                        categories[index].desc[0].toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categories[index].desc,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}


