import 'package:bloc_pattern/src/blocks/LoginBlock.dart';
import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  static LoginProvider _instance;

  factory LoginProvider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new LoginProvider._internal(key: key, child: child);
    }
    return _instance;
  }

  LoginProvider._internal({Key key, Widget child})
      : super(key: key, child: child);

  final loginBlock = new LoginBlock();

  static LoginBlock of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginProvider>()
        .loginBlock;
  }

  @override
  bool updateShouldNotify(LoginProvider oldWidget) => true;
}
