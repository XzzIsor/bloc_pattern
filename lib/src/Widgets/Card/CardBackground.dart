import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({Key key, @required this.height, @required this.borderRadius}) : super(key: key);

  final double height;
  final double borderRadius; 

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        height: height,
        child: FadeInImage(
          placeholder: AssetImage('assets/progress-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
