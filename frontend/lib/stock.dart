import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:http/http.dart' as http;
import 'package:predict_pro/item.dart';
import 'package:predict_pro/services/remote_services/categories_service_imp.dart';
import 'package:predict_pro/services/remote_services/category_service.dart';
import 'package:predict_pro/services/remote_services/items_service_imp.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'Models/category_model.dart';
import 'Models/item_model.dart';
import 'package:predict_pro/services/remote_services/item_service.dart';
import 'package:predict_pro/services/local_services/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<Category> categories = [];

  CategoriesService categoriesService = CategoriesServiceImp();
  @override
  void initState() {
    super.initState();
    categoriesService.getCategories().then((categories){
    Provider.of<CategoriesProvider>(context, listen: false).saveCategories(categories ?? []);

    });

  }

  @override
  Widget build(BuildContext context) {
    categories = Provider.of<CategoriesProvider>(context).categories;
    print (categories);

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
                        Navigator.of(context).pushNamed("/item");
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


