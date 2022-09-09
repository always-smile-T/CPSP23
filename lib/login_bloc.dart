import 'dart:async';
import 'package:do_st/validation.dart';




class LoginBloc {
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;


  bool isValidUsername(String username) {
    if (!Validation.isValidUser(username)) {
      _emailController.sink.addError("wrong email format");
      //sink la input
      //stream la output
      return false;
    }
    _emailController.sink.add("OK");
    return true;
  }
  bool isValidPassword(String password) {
    if (!Validation.isValidPass(password)) {
      _passController.sink.addError("min is 6 characters");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }


  void dispose() {
    _emailController.close();
    _passController.close();
  }
}
