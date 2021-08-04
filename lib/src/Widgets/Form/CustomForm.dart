import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bloc_pattern/Providers/LoginProvider.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: login.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextField(
              label: 'E-mail',
              icon: Icons.email_sharp,
              hintText: 'example123@gmail.com',
              onChange: (value) => login.email = value,
              emailType: true,
              obscureText: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: 'Contraseña',
              icon: Icons.email_sharp,
              hintText: 'Shhh',
              onChange: (value) => login.password = value,
              emailType: false,
              obscureText: true,
            ),
            SizedBox(height: 50),
            CustomButton(
                text: login.isLoading ? 'Espere...' : 'Ingresar',
                onTap: login.isLoading ? null : () async {
                    if (!login.isValidForm()) return;
                    login.isLoading = true;

                    //TODO: Validar usuario
                    await Future.delayed(Duration(seconds: 2));
                    login.isLoading = false;
                    Navigator.pushReplacementNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}
