class User {
  int? id;
  String? username;
  String? email;
  String? token;
  User({
    this.id,this.username, this.email,this.token});

    // convert json to user model
    factory User.fromJson(Map<String, dynamic> json){
      return User(
        id: json['user']['id'],
        username: json['user']['username'],
        email: json['user']['email'],
        token: json['User']['token']
      );
    }
}