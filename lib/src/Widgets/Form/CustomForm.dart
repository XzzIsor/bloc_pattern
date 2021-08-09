import 'package:bloc_pattern/services/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/Providers/LoginProvider.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key, required this.buttonMessage}) : super(key: key);
  final String buttonMessage;

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginProvider>(context);

    CustomTextField _emailInput = CustomTextField(
        label: 'E-mail',
        icon: Icons.email_sharp,
        hintText: 'example123@gmail.com',
        onChange: (value) => login.email = value,
        emailType: true,
        obscureText: false,
        validator: (value) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = new RegExp(pattern);
          String? respEmail = regExp.hasMatch(value ?? '')
              ? null
              : 'No es un correo electrónico';
          return respEmail;
        });

    CustomTextField _passwordInput = CustomTextField(
      label: 'Contraseña',
      icon: Icons.email_sharp,
      hintText: 'Shhh',
      onChange: (value) => login.password = value,
      emailType: false,
      obscureText: true,
      validator: (value) {
        String? resp = value != null && value.length >= 6
            ? null
            : 'La contraseña es muy corta';
        return resp;
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: login.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 20),
            _emailInput,
            SizedBox(height: 20),
            _passwordInput,
            SizedBox(height: 50),
            CustomButton(
              text: login.isLoading ? 'Espere...' : buttonMessage,
              onTap: login.isLoading
                  ? null
                  : () async {
                      buttonMessage == 'Crear'
                          ? await _createUser(context, login)
                          : await _loginUser(context, login);
                    },
            )
          ],
        ),
      ),
    );
  }

  _createUser(BuildContext context, LoginProvider login) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (!login.isValidForm()) return;

    login.isLoading = true;
    final String? errorMessage =
        await authService.createUser(login.email, login.password);
    if (errorMessage == null) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      NotifyService.showSnackBar('El correo ya existe');
      login.isLoading = false;
    }
  }

  _loginUser(BuildContext context, LoginProvider login) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (!login.isValidForm()) return;

    login.isLoading = true;
    final String? errorMessage =
        await authService.loginUser(login.email, login.password);
    if (errorMessage == null) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      NotifyService.showSnackBar('El usuario o contraseña no son válidos');
      login.isLoading = false;
    }
  }
}
