import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc_pattern/services/services.dart';
import 'src/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductService()),
          ChangeNotifierProvider(create: (_) => AuthService()),
        ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'check' :  (BuildContext context) => CheckAuthScreen(),

        '/': (BuildContext context) => HomeScreen(),
        'product': (BuildContext context) => ProductScreen(),

        'singup' : (BuildContext context) => SingUpScreen(),
        'login': (BuildContext context) => LoginScreen(),
      },
      scaffoldMessengerKey: NotifyService.messageKey,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple, elevation: 0),
      ),
    );
  }
}
