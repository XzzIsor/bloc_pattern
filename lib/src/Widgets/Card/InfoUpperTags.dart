import 'package:flutter/material.dart';

class InfoUpperTags extends StatelessWidget {
  const InfoUpperTags({Key? key,required this.text,required this.width, required this.height, required this.color}) : super(key: key);
  final String text;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        color: color);
  }
}
