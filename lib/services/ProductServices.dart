import 'package:flutter/material.dart';

import 'package:bloc_pattern/models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseURL = 'products-app-1d196-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  late Product selectedProduct;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempPro = Product.fromMap(value);
      tempPro.id = key;
      this.products.add(tempPro);
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  Future savedOrCreatedProduct(Product product) async {
    print('hola1');
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      print('hola2');
      //Crear
    } else {
      //Actualizar
      print('hola3');
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseURL, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    print('Hola' + decodedData);

    //Actualizar lista de productos

    return product.id!;
  }
}
