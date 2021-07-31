import 'package:bloc_pattern/src/Widgets/Card/InfoUpperTags.dart';
import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({Key? key, required this.borderRadius, required this.width, required this.height, required this.price}) : super(key: key);
  final double borderRadius;
  final double price;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius), bottomLeft: Radius.circular(borderRadius)),
      child: InfoUpperTags(
        text: '\$' + '$price', 
        width: width, 
        height: height, 
        color: Colors.deepPurpleAccent
      )
    );
  }
}
