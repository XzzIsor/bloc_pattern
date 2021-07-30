import 'package:bloc_pattern/src/Widgets/Card/ProductCard.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            ProductImage()
          ]
        ),

      ),

    );
  }
}
