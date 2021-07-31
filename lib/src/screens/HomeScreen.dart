import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:bloc_pattern/services/services.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';
import 'package:bloc_pattern/src/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
      ),
      body: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: ProductCard(
                  product: productService.products[index],
                ),
                onTap: () {
                  productService.selectedProduct = productService.products[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
              )),
      floatingActionButton: CustomFloatingButton(),
    );
  }
}
