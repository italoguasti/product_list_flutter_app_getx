import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/product_model.dart';
import '../widgets/gradient_color_widget.dart';
import '../widgets/input_text.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _typeController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  late HomeController homeController;
  late ProductModel productModel;
  late int index;

  @override
  void initState() {
    final map = Get.arguments as Map;
    homeController = map['controller'];
    productModel = map['productModel'];
    index = map['index'];


    _typeController.text = productModel.type;
    _titleController.text = productModel.title;
    _priceController.text = productModel.price.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Product',
        ),
        flexibleSpace: Container(
          decoration: gradientColorWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            InputText(
              labelText: 'Type',
              controller: _typeController,
            ),
            const SizedBox(height: 8.0),
            InputText(
              labelText: 'Title',
              controller: _titleController,
            ),
            const SizedBox(height: 8.0),
            InputText(
              labelText: 'Price',
              controller: _priceController,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                final productModel = ProductModel(
                  title: _titleController.text,
                  type: _typeController.text,
                  description: 'TestEdit',
                  filename: '3.jpg',
                  height: 40,
                  width: 196,
                  price: double.parse(_priceController.text),
                  rating: 5,
                );
                homeController.editProduct(productModel, index);
                Get.back();
              },
              child: Text(
                'Confirm edit',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
