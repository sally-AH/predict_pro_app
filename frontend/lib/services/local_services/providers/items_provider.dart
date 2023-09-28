import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:predict_pro/Models/item_model.dart';

class ItemsProvider with ChangeNotifier {
  List<Item> items;
  ItemsProvider({required this.items});

  void saveItems(List<Item> items) {
    this.items = items;

    notifyListeners();
  }
}