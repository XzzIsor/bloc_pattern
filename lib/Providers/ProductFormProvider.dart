import 'package:flutter/material.dart';
import 'package:bloc_pattern/models/models.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product product;

  ProductFormProvider({required this.product});

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
