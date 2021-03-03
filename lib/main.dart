import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/screens/HomeScreen.dart';
import 'package:bloc_pattern/src/blocks/LoginProvider.dart';
import 'package:bloc_pattern/src/screens/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'juan es gei',
        initialRoute: 'login',
        routes: {
          '/': (BuildContext context) => HomeScreen(),
          'login': (BuildContext context) => LoginScreen()
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
