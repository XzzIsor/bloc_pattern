import 'package:flutter/material.dart';

import 'package:bloc_pattern/src/Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Producto'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            child: ProductCard(),
            onTap:() => Navigator.pushNamed(context, 'product'),
          )
        ),
        floatingActionButton: CustomFloatingButton(),
      );
  }
}