import 'package:bloc_pattern/src/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/Widgets/CustomTextField.dart';

class CustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
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
                )
              ]
            ),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),    
            child: Column(
              children:[ 
                Text('Login'),
                SizedBox(height: 30.0),
                CustomTextField(icon: Icons.email_outlined, label: 'Correo', obscureText: false),
                SizedBox(height: 30.0),
                CustomTextField(icon: Icons.lock_clock,  label: 'Contraseña', obscureText: true),
                SizedBox(height: 30.0),
                CustomButton(onTap: (){}, text: "Ingresar",)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
