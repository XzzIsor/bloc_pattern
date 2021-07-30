import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: _productImageDeco(),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: FadeInImage(
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            placeholder: AssetImage('assets/progress-loading.gif'),
            fit: BoxFit.cover,
          ),
        ),

      ),
    );
  }

  BoxDecoration _productImageDeco() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 2.0,
        offset: Offset(5,5)
      )
    ]

  );

}
