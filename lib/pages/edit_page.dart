import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../validation/validation.dart';

import '../controllers/home_controller.dart';
import '../models/product_model.dart';
import '../theme/app_gradient_color.dart';
import '../widgets/custom_rating.dart';
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
  final _descriptionController = TextEditingController();
  double _rating = 0.0;
  final _formKey = GlobalKey<FormState>();

  final _typeFocus = FocusNode();
  final _priceFocus = FocusNode();
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
    _rating = productModel.rating;
    _descriptionController.text = productModel.description;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _typeFocus.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
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
                    FocusScope.of(context).requestFocus(_descriptionFocus),
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
                  final product = ProductModel(
                    id: '',
                    title: _titleController.text,
                    type: _typeController.text,
                    description: _descriptionController.text,
                    price: double.tryParse(_priceController.text) ?? 0,
                    rating: _rating,
                  );
                  homeController.updateProduct(product, index);
                  Navigator.of(context).pop();
                }
,
                validator: (v) => MyDescription(v!).validator(),
              ),
              const SizedBox(height: 12.0),
              CustomRating(
                initialRating: _rating,
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(height: 14.0),
              TextButton(
                onPressed: () {
                  final product = ProductModel(
                    id: '',
                    title: _titleController.text,
                    type: _typeController.text,
                    description: _descriptionController.text,
                    price: double.tryParse(_priceController.text) ?? 0,
                    rating: _rating,
                  );
                  homeController.updateProduct(product, index);
                  Navigator.of(context).pop();
                }
,
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
