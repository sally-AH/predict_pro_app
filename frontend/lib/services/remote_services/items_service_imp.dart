import 'package:predict_pro/config/request.dart';
import 'package:predict_pro/services/remote_services/item_service.dart';
import 'package:predict_pro/Models/item_model.dart';

class ItemsServiceImp implements ItemsService {
  @override
  Future <List<Item>?> getItems() async {
    try{
      final categoryList = await sendRequest(route: "getCategoryProducts");
      List<Item> list=[];
      categoryList.forEach((item){
        Item itm = Item.fromJson(item);
        list.add(itm);
      });
      return list;
    }catch(error){
      print(error);
    }

  }
}