import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../controllers/home_controller.dart';
import '../widgets/gradient_color_widget.dart';
import '../widgets/input_text.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _typeController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    final map = Get.arguments as Map;
    homeController = map['controller'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Product',
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
                  description: 'Estagiario',
                  filename: '1.jpg',
                  height: 44,
                  width: 299,
                  price: double.parse(_priceController.text),
                  rating: 1,
                );
                homeController.addProduct(productModel);
                Get.back();
              },
              child: Text(
                'Add',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
