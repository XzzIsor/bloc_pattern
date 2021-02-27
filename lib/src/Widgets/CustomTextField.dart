import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  final bool emailType;
  final Function onChange; 
  final String counterText;
  CustomTextField({this.icon, this.label, this.obscureText, this.emailType, this.onChange, this.counterText});

  
  @override
  Widget build(BuildContext context) {

    final keyboardType = emailType? TextInputType.emailAddress : TextInputType.text;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        onChanged: onChange,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          counterText: counterText,
          icon: Icon(icon, color: Colors.deepPurple),
          labelText: label,
        ),
      ),
    );
  }
}
