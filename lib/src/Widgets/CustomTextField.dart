import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  CustomTextField({this.icon, this.label, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.deepPurple),
          labelText: label,
        ),
      ),
    );
  }
}
