class User {
  int? id;
  String? username;
  String? password;

  User({
    this.username,
    this.password,
  });

  User.fromMap(dynamic obj) {
    username = obj['username'];
    password = obj['password'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["username"] = username;
    map["password"] = password;
    return map;
  }
}
