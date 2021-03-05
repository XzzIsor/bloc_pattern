import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/blocks/LoginBlock.dart';
import 'package:bloc_pattern/src/blocks/SignInWithGoogle.dart';
import 'package:bloc_pattern/src/blocks/LoginProvider.dart';

import '../CustomButton.dart';
import '../CustomTextField.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final isValid = false;

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
        customButton(bloc, context),
        logInWithGoogle(),
      ],
    );
  }
}

Widget customButton(LoginBlock bloc, BuildContext context) => StreamBuilder(
      stream: bloc.isValid,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return CustomButton(
          onTap: snapshot.hasData ? () => login(context) : null,
          text: "Ingresar",
        );
      },
    );

void login(BuildContext context) {
  Navigator.pushReplacementNamed(context, "/"); 
}

Widget logInWithGoogle() => CustomButton(
      onTap: () {
        SignInWithGoogle signIn = new SignInWithGoogle();
        signIn.signInWithGoogle();
      },
      text: "Ingresar con Google",
      image: "assets/Google.jpg",
    );

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
          errorText: snapshot.error,
        );
      },
    );

Widget passwordStreamBuilder(LoginBlock bloc) => StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return CustomTextField(
          icon: Icons.lock_clock,
          label: 'Contraseña',
          obscureText: true,
          emailType: false,
          onChange: bloc.changePassword,
          counterText: snapshot.data,
          errorText: snapshot.error,
        );
      },
    );
