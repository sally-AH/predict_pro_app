import 'package:predict_pro/stock.dart';

abstract class CategoriesService {
  Future <List<StockPage>> getCategories();
  
}