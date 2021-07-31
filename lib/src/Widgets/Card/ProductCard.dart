import 'package:bloc_pattern/models/models.dart';
import 'package:bloc_pattern/src/Widgets/Card/CardDetails.dart';
import 'package:bloc_pattern/src/Widgets/Card/CardBackground.dart';
import 'package:bloc_pattern/src/Widgets/Card/PriceTag.dart';
import 'package:bloc_pattern/src/Widgets/Card/ProductNotAvalible.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  static const double _height = 300;
  static const double _borderRadius = 25;
  static const double _width = 400;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 30),
        width: _width,
        height: _height,
        decoration: _cardBorder(),
        child: _content(),
      ),
    );
  }

  BoxDecoration _cardBorder() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2.0, offset: Offset(5, 5))
          ]);

  Stack _content() => Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CardBackground(
            image: product.picture,
            height: _height,
            borderRadius: _borderRadius,
          ),
          CardDetails(
            name: product.name,
            borderRadius: _borderRadius,
            width: _width * 0.7,
            height: _height * 0.23,
          ),
          Positioned(
              child: PriceTag(
                  price: product.price,
                  borderRadius: _borderRadius,
                  height: _height * 0.17,
                  width: _width * 0.25),
              top: 0,
              right: 0),

          _showNotAvalible()
        ],
      );

  Widget _showNotAvalible() {
    return !product.available
        ? Positioned(
            child: ProductNotAvalible(
                borderRadius: _borderRadius,
                height: _height * 0.17,
                width: _width * 0.30),
            top: 0,
            left: 0)
        : Container();
  }
}
