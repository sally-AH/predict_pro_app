import 'package:predict_pro/stock.dart';
import 'package:predict_pro/Models/category_model.dart';

abstract class CategoriesService {
  Future <List<Category>?> getCategories();

}