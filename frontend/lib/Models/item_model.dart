class Item{
  final int id;
  final String desc;
  final double price;
  final int categoryId;
  Item({
  required this.id,
    required this.desc,
    required this.price,
    required this.categoryId
  });

  factory Item.fromJson (Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      desc: json['desc'],
      price: json['stocks']['unit_price'],
      categoryId: json['category_id'],
    );
  }
}