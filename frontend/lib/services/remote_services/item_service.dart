import 'package:predict_pro/Models/item_model.dart';

abstract class ItemsService {
  Future <List<Item>?> getItems();

}