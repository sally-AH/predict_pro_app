// import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:predict_pro/Models/category_model.dart';
import 'package:predict_pro/Models/item_model.dart';


class CategoriesProvider with ChangeNotifier {
  List<Category> categories;
  CategoriesProvider({required this.categories});
  void saveCategories(List<Category> categories){
    this.categories = categories;
    notifyListeners();
  }

  void fillItems(List<Item> items) {
    categories.forEach((cat) {
      cat = cat.copyWith(
          items: items.where((item) => item.categoryId == cat.id).toList());
    });
  }
}