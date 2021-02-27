import 'package:bloc_pattern/src/blocks/LoginBlock.dart';
import 'package:flutter/material.dart';

class LoginProvider extends InheritedWidget {
  LoginProvider({Key key, this.child}) : super(key: key, child: child);

  final loginBlock = new LoginBlock(); 

  final Widget child;

  static LoginBlock of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginProvider>().loginBlock;
  }

  @override
  bool updateShouldNotify(LoginProvider oldWidget) => true;
}
