import 'package:bloc_pattern/src/blocks/LoginBlock.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/blocks/LoginProvider.dart';

import '../CustomButton.dart';
import '../CustomTextField.dart';

class CustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return Column(
      children: [
        Text('Login'),
        SizedBox(height: 30.0),
        emailStreamBuilder(bloc),
        SizedBox(height: 30.0),
        passwordStreamBuilder(bloc),
        SizedBox(height: 30.0),
        CustomButton(
          onTap: () {},
          text: "Ingresar",
        )
      ],
    );
  }
}

Widget emailStreamBuilder(LoginBlock bloc) => StreamBuilder(
  stream: bloc.emailStream,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return CustomTextField(
      icon: Icons.email_outlined,
      label: 'Correo',
      obscureText: false,
      emailType: true,
      counterText: snapshot.data,
      onChange: bloc.changeEmail,
    );
  },
); 


Widget passwordStreamBuilder(LoginBlock bloc)=> StreamBuilder(
  stream: bloc.passwordStream,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return CustomTextField(
        icon: Icons.lock_clock, 
        label: 'Contraseña', 
        obscureText: true,
        emailType: false,
        onChange: bloc.changePassword,
        counterText: snapshot.data,
    );
  },
);
