import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bloc_pattern/services/services.dart';
import 'package:bloc_pattern/src/Widgets/widgets.dart';
import 'package:bloc_pattern/Providers/ProductFormProvider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProductFormProvider(productService.selectedProduct),
        child: _ProductScreenBody(productService: productService));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductFormProvider>(context);

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
                      onPressed: () => _imagePicker(ImageSource.camera),
                      icon: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.white,
                        size: 30,
                      ))),
                Positioned(
                  top: 120,
                  right: 20,
                  child: IconButton(
                      onPressed: () => _imagePicker(ImageSource.gallery),
                      icon: Icon(
                        Icons.library_add,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: productService.isSaving ? CircularProgressIndicator(color: Colors.white) : Icon(Icons.save_alt_sharp),
        onPressed: productService.isSaving ? null : () async {
          if (!productProvider.isValidForm()) return;

          final String? imgURL = await productService.uploadImage();

          if (imgURL != null) productProvider.product.picture = imgURL;

          await productService.savedOrCreatedProduct(productProvider.product);
        },
      ),
    );
  }

  void _imagePicker(ImageSource imageSource) async {

    final imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
      source: imageSource,
      imageQuality: 100,
      );
      if (pickedFile == null) {
        return;
      }
      productService.updateProductImage(pickedFile.path);

  }

}
