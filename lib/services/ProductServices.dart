import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

import 'package:bloc_pattern/models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseURL = 'products-app-1d196-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;
  late Product selectedProduct;
  File? pictureFile;

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
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await _createProduct(product);
    } else {
      await _updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> _updateProduct(Product product) async {
    final url = Uri.https(_baseURL, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    products[products.indexWhere((element) => element.id == product.id)] =
        product;

    return product.id!;
  }

  Future<String> _createProduct(Product product) async {
    final url = Uri.https(_baseURL, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);
    product.id = decodedData['name'];

    products.add(product);

    return '';
  }

  void updateProductImage(String path) {
    selectedProduct.picture = path;
    pictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (pictureFile == null) return null;
    this.isSaving = true;

    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/xssisorimg/image/upload?upload_preset=products_app');

    final imageRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', pictureFile!.path);

    imageRequest.files.add(file);

    final streamResponse = await imageRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo explotó');
      print(resp.body);
      return null;
    }

    pictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
