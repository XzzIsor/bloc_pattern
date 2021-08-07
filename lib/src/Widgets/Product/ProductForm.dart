import 'package:bloc_pattern/src/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:bloc_pattern/Providers/ProductFormProvider.dart';

class ProductForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductFormProvider>(context);
    final product = productProvider.product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Form(
            key: productProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                    isPrice: false,
                    initialValue: product.name,
                    label: 'Nombre del producto',
                    icon: Icons.production_quantity_limits_outlined,
                    hintText: 'Producto',
                    onChange: (value) => product.name = value,
                    emailType: false,
                    obscureText: false,
                    isLogin: false),
                SizedBox(height: 30),
                CustomTextField(
                    isPrice: true,
                    initialValue: '${product.price}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    label: 'Precio del Producto',
                    icon: Icons.money,
                    hintText: '\$10.0',
                    onChange: (value) {
                      if (double.tryParse(value) == null) {
                        product.price = 0;
                      } else {
                        product.price = double.parse(value);
                      }
                    },
                    emailType: false,
                    obscureText: false,
                    isLogin: false),
                SizedBox(height: 30),
                SwitchListTile(
                    title: Text('Disponible'),
                    activeColor: Colors.deepPurple,
                    value: product.available,
                    onChanged: productProvider.updateAvailability),
                SizedBox(height: 20),
              ],
            ),
          ),
          decoration: _decoration()),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2.0, offset: Offset(5, 5))
          ]);
}
