import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomButton({ this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(text),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: onTap,
    );
  }
}
