import 'package:predict_pro/config/request.dart';
import 'package:predict_pro/services/remote_services/category_service.dart';
import 'package:predict_pro/Models/category_model.dart';
import 'package:predict_pro/stock.dart';

class CategoriesServiceImp implements CategoriesService {
  @override
  Future <List<StockPage>?> getCategories() async {
    try{
      final categoryList = await sendRequest(route: "http://192.168.0.104:8000/api/getcategories");
      List<Category> list=[];
      categoryList.forEach((category){
        Category cat = Category.fromJson(category);
        list.add(cat);
      });
      return list;
    }catch(error){
      print(error);
    }

  }
}