import 'package:predict_pro/Models/item_model.dart';

class Category {
  final int id;
  final String desc;
  List<Item> items = [];


  Category({
    required this.id,
    required this.desc,
    required this.items
  });
  factory Category.fromJson (Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      desc: json['desc'],
      items:[]
    );
  }
 Category copyWith ({
    String? desc,
   List<Item>? items,
}) =>
     Category (
       id:id,
       desc: desc?? this.desc,
       items: items ?? this.items,
     );

}