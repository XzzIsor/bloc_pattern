
import 'package:flutter/material.dart';
import 'package:bloc_pattern/services/services.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(image: productService.selectedProduct.picture),
              Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      ))),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                      onPressed: () {
                        //TODO: Cámara o Galería
                      },
                      icon: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 30,
                      ))),
            ],
          ),
          ProductForm(),
          SizedBox(
            height: 100,
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt),
        onPressed: () {},
      ),
    );
  }
}
