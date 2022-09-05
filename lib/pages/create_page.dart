import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../controllers/home_controller.dart';
import '../theme/app_gradient_color.dart';
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

  final _typeFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _ratingFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  late HomeController homeController;

  @override
  void initState() {
    final map = Get.arguments as Map;
    homeController = map['controller'];
    super.initState();
  }

  void createProduct() {
    if (_formKey.currentState?.validate() == true) {
      final productModel = ProductModel(
        title: _titleController.text,
        type: _typeController.text,
        description: _descriptionController.text,
        filename: '51.jpg',
        height: 10,
        width: 20,
        price: double.parse(_priceController.text),
        rating: int.parse(_ratingController.text),
      );

      homeController.addProduct(productModel);
      Get.back();
    }
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
              InputTextFormField(
                labelText: 'Title',
                controller: _titleController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_typeFocus),
                validator: (titleValidate) {
                  final title = titleValidate ?? '';
                  if (title.trim().isEmpty) {
                    return 'Title is obrigatory.';
                  }
                  if (title.trim().length < 3) {
                    return 'The title needs at least 3 letters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              InputTextFormField(
                labelText: 'Type',
                controller: _typeController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _typeFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocus),
                validator: (typeValidate) {
                  final type = typeValidate ?? '';
                  if (type.trim().isEmpty) {
                    return 'Type is obrigatory.';
                  }
                  if (type.trim().length < 3) {
                    return 'The type needs at least 3 letters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              InputTextFormField(
                labelText: 'Price',
                controller: _priceController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_ratingFocus),
                validator: (priceValidate) {
                  final priceString = priceValidate ?? '';
                  final price = double.tryParse(priceString) ?? -1;
                  if (price <= 0) {
                    return 'Enter a valid price.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              InputTextFormField(
                labelText: 'Rating',
                controller: _ratingController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _ratingFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocus),
                validator: (ratingValidate) {
                  final ratingString = ratingValidate ?? '';
                  final rating = double.tryParse(ratingString) ?? -1;
                  if (rating <= 0 || rating > 5) {
                    return 'Enter a valid rating.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              InputTextFormField(
                labelText: 'Description',
                controller: _descriptionController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _descriptionFocus,
                validator: (descriptionValidate) {
                  final description = descriptionValidate ?? '';
                  if (description.trim().isEmpty) {
                    return 'Description is obrigatory.';
                  }
                  if (description.trim().length < 6) {
                    return 'The description needs at least 6 letters.';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  createProduct();
                },
              ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  createProduct();
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
