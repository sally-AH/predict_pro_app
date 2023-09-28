// import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:predict_pro/Models/category_model.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> categories;
  CategoriesProvider({required this.categories});
  void saveCategories(List<Category> categories){
    this.categories = categories;
    notifyListeners();
  }
}