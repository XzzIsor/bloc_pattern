import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255,255,255,0.05),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}