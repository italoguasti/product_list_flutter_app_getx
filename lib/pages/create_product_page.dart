import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../controllers/home_controller.dart';
import '../widgets/gradient_color_widget.dart';
import '../widgets/input_text_widget.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _typeController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 8.0),
              // InputTextFormField(
              //   labelText: 'Type',
              //   controller: _typeController,
              //   textInputType: TextInputType.text,
              //   textInputAction: TextInputAction.next,
              // ),
              // const SizedBox(height: 8.0),
              // InputTextFormField(
              //   labelText: 'Title',
              //   controller: _titleController,
              //   textInputType: TextInputType.text,
              //   textInputAction: TextInputAction.next,
              // ),
              // const SizedBox(height: 8.0),
              // InputTextFormField(
              //   labelText: 'Price',
              //   controller: _priceController,
              //   textInputType: TextInputType.number,
              //   textInputAction: TextInputAction.next,
              // ),
              // const SizedBox(height: 8.0),
              // InputTextFormField(
              //   labelText: 'Rating',
              //   controller: _ratingController,
              //   textInputType: TextInputType.number,
              //   textInputAction: TextInputAction.next,
              // ),
              // const SizedBox(height: 8.0),
              // InputTextFormField(
              //   labelText: 'Description',
              //   controller: _descriptionController,
              //   textInputType: TextInputType.text,
              //   textInputAction: TextInputAction.done,
              // ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  final productModel = ProductModel(
                    title: _titleController.text,
                    type: _typeController.text,
                    description: 'Test1',
                    filename: '1.jpg',
                    height: 20,
                    width: 98,
                    price: double.parse(_priceController.text),
                    rating: 5,
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
      ),
    );
  }
}
