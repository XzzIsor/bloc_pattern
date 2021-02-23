import 'package:bloc_pattern/src/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/src/screens/HomeScreen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titulo uwu',
      initialRoute: 'login',
      routes: {
        '/' : (BuildContext context) => HomeScreen(),
        'login' :   (BuildContext context) => LoginScreen()
      },
    );
  }
}
