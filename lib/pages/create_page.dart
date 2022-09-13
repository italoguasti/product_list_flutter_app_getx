import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import '../validation/validation.dart';

import '../controllers/home_controller.dart';
import '../theme/app_gradient_color.dart';
import '../widgets/custom_rating.dart';
import '../widgets/my_text_form_field.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _typeController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  double _rating = 0.0;

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
        price: double.parse(_priceController.text.extractNumbers()),
        rating: _rating,
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              const SizedBox(height: 8.0),
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
                labelText: 'Description',
                controller: _descriptionController,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _descriptionFocus,
                onFieldSubmitted: (_) {
                  createProduct();
                },
                validator: (v) => MyDescription(v!).validator(),
              ),
              const SizedBox(height: 8.0),
              CustomRating(
                initialRating: _rating,
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  createProduct();
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
