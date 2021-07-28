import 'package:bloc_pattern/src/blocks/Providers/LoginProvider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("email: = " +  bloc.email),
          Divider(),
          Text("Contraseña: =  " + bloc.password),
        ],

      ),
    );
  }
}