class Item{
  final int id;
  final String desc;
  final double price;

  Item({
  required this.id,
    required this.desc,
    required this.price,
  });

  factory Item.fromJson (Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      desc: json['desc'],
      price: json['stocks']['unit_price'],
    );
  }
}