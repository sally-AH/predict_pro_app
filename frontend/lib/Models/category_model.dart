class Category {
  final int id;
  final String desc;

  Category({
    required this.id,
    required this.desc
  });
  factory Category.fromJson (Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      desc: json['desc'],
    );
  }


}