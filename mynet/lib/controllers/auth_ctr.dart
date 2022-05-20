import 'dart:async';
import 'package:mynet/controllers/database_helper.dart';
import 'package:mynet/models/user_model.dart';

class AuthCtr {
  DatabaseHelper con = DatabaseHelper();
  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient!.insert("User", user.toMap());
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient!.delete("User");
    return res;
  }

  Future<dynamic> getLogin(String user, String password) async {
    var dbClient = await con.db;
    var res = await dbClient!.rawQuery(
        "SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient!.query("user");

    List<User>? list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : null;
    return list ?? [];
  }
}
