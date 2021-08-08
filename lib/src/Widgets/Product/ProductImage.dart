import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? image;

  const ProductImage({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: _productImageDeco(),
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getImage(image),
          ),
        ),
      ),
    );
  }

  Widget getImage(String? picturePath) {
    if (picturePath == null) {
      return FadeInImage(
          image: NetworkImage('https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg'),
          placeholder: AssetImage('assets/progress-loading.gif'),
          fit: BoxFit.cover);
    }

    if (picturePath.startsWith('http')) {
      return FadeInImage(
          image: NetworkImage(image != null
              ? image!
              : 'https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg'),
          placeholder: AssetImage('assets/progress-loading.gif'),
          fit: BoxFit.cover);
    }

    return Image.file(
      File(picturePath),
      fit: BoxFit.cover,
    );
  }

  BoxDecoration _productImageDeco() => BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2.0, offset: Offset(5, 5))
          ]);
}
