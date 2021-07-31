import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  final bool emailType;
  final Function onChange;
  final String? errorText;
  final String? counterText;
  final Color color;

  CustomTextField(
      {required this.icon,
      required this.label,
      required this.obscureText,
      required this.emailType,
      required this.onChange,
      this.counterText,
       this.errorText, 
      required this.color});

  @override
  Widget build(BuildContext context) {
    final keyboardType =
        emailType ? TextInputType.emailAddress : TextInputType.text;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        onChanged: (string) => onChange,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: inputDeco(
          counterText: counterText!, 
          icon: icon, 
          label: label, 
          errorText: errorText!,
          color: color
        ),
      ),
    );
  }

  InputDecoration inputDeco(
      {String? counterText, required IconData icon, required String label, String? errorText, required Color color}) {
    return InputDecoration(
      counterText: counterText,
      icon: Icon(icon, color: color),
      labelText: label,
      errorText: errorText,
    );
  }
}
