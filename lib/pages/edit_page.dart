import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../validation/validation.dart';

import '../controllers/home_controller.dart';
import '../models/product_model.dart';
import '../theme/app_gradient_color.dart';
import '../widgets/my_text_form_field.dart';

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

    _titleController.text = productModel.title.toString();
    _typeController.text = productModel.type.toString();
    _priceController.text = productModel.price.toString();
    _ratingController.text = productModel.rating.toString();
    _descriptionController.text = productModel.description;
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
        price: double.parse(_priceController.text.extractNumbers()),
        rating: int.parse(_ratingController.text),
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              MyTextFormField(
                labelText: 'Title',
                controller: _titleController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_typeFocus),
                validator: (v) => MyTitle(v!).validator(),
              ),
              const SizedBox(height: 8.0),
              MyTextFormField(
                labelText: 'Type',
                controller: _typeController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _typeFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocus),
                validator: (v) => MyType(v!).validator(),
              ),
              const SizedBox(height: 8.0),
              MyTextFormField(
                labelText: 'Price',
                controller: _priceController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_ratingFocus),
                validator: (v) => MyPrice(v!).validator(),
                inputFormatters: [CurrencyInputFormatter()],
              ),
              const SizedBox(height: 8.0),
              MyTextFormField(
                labelText: 'Rating',
                controller: _ratingController,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _ratingFocus,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocus),
                validator: (v) => MyRating(v!).validator(),
              ),
              const SizedBox(height: 8.0),
              MyTextFormField(
                labelText: 'Description',
                controller: _descriptionController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _descriptionFocus,
                onFieldSubmitted: (_) {
                  updateProduct();
                },
                validator: (v) => MyDescription(v!).validator(),
              ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  updateProduct();
                },
                child: Text(
                  'Submit',
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
