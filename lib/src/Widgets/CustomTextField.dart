import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  final bool emailType;
  CustomTextField({this.icon, this.label, this.obscureText, this.emailType});

  
  @override
  Widget build(BuildContext context) {

    final keyboardType = emailType? TextInputType.emailAddress : TextInputType.text;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.deepPurple),
          labelText: label,
        ),
      ),
    );
  }
}
