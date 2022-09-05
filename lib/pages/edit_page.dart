import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/product_model.dart';
import '../theme/app_gradient_color.dart';
import '../widgets/input_text_widget.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _typeController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _typeFocus = FocusNode();
  final _priceFocus = FocusNode();
  final _ratingFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  late HomeController homeController;
  late ProductModel productModel;
  late int index;

  @override
  void initState() {
    final map = Get.arguments as Map;
    homeController = map['controller'];
    productModel = map['productModel'];
    index = map['index'];

    _titleController.text = productModel.title;
    _typeController.text = productModel.type;
    _descriptionController.text = productModel.description;
    _priceController.text = productModel.price.toString();
    _ratingController.text = productModel.rating.toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _typeFocus.dispose();
    _priceFocus.dispose();
    _ratingFocus.dispose();
    _descriptionFocus.dispose();
  }

  void updateProduct() {
    if (_formKey.currentState?.validate() == true) {
      final productModel = ProductModel(
        title: _titleController.text,
        type: _typeController.text,
        description: _descriptionController.text,
        filename: '51.jpg',
        height: 40,
        width: 196,
        price: double.parse(_priceController.text),
        rating: 5,
      );

      homeController.editProduct(productModel, index);
      Get.back();
    }
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
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
                  updateProduct();
                },
              ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  updateProduct();
                },
                child: Text(
                  'Confirm edit',
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
