import 'package:bloc_pattern/Providers/LoginProvider.dart';
import 'package:bloc_pattern/services/services.dart';
import 'package:flutter/material.dart';

import 'src/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ProductService())],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        'login': (BuildContext context) => LoginScreen(),
        'product': (BuildContext context) => ProductScreen()
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple, elevation: 0),
      ),
    );
  }
}
