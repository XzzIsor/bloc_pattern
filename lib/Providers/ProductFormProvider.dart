import 'package:flutter/material.dart';
import 'package:bloc_pattern/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

  updateAvailability(bool value) {
    print(value);
    this.product.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(product.name);
    print(product.price);
    print(product.available);
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}
