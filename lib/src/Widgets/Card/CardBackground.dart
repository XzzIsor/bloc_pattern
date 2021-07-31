import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  const CardBackground({Key? key, required this.height, required this.borderRadius, this.image}) : super(key: key);

  final String? image;
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
          image: NetworkImage(image != null? image! : 'https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
