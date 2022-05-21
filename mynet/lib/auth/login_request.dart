import 'dart:async';

import 'package:mynet/controllers/auth_ctr.dart';
import 'package:mynet/models/user_model.dart';

class LoginRequest {
  AuthCtr con = AuthCtr();
  Future<dynamic> getLogin(String username, String password) {
    var result = con.getLogin(username, password);
    return result;
  }
}
