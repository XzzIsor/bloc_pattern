import 'package:bloc_pattern/src/Widgets/Card/InfoUpperTags.dart';
import 'package:flutter/material.dart';

class ProductNotAvalible extends StatelessWidget {
  const ProductNotAvalible({Key key, @required this.borderRadius, @required this.width, @required this.height}) : super(key: key);
  final double borderRadius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
      child: InfoUpperTags(
        text: 'No Disponible', 
        color: Colors.amberAccent,
        height: height,
        width: width,
      )
      );
  }
}
