import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bloc_pattern/Providers/LoginProvider.dart';
import 'package:bloc_pattern/src/Widgets/Form/CustomForm.dart';


class FormContainer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  offset: Offset(5,5)
                )
              ]
            ),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),    
            child: ChangeNotifierProvider(
            create: (_) => LoginProvider(), 
            child: CustomForm()
            ),
          ),
          SizedBox(height: 50),
          Text('Crear Nueva Cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}