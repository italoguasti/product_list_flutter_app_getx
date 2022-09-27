import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../data/products_repository.dart';



class HomeController extends GetxController {
  final repository = ProductsRepository(Dio());
  //Gerenciar
  final Rx<List<ProductModel>> _products = Rx([]);
  //Acessar lista
  Stream<List<ProductModel>> get productsStream => _products.stream;

  void findProducts() async {
    try {
      _products.value = await repository.findAllProducts();
    } catch (e) {
      print(e);
    }
  }

  void removeProduct(ProductModel product) async {
    await repository.removeThisProduct(product);
  }

  // editProduct(ProductModel productModel, int index) {
  //   products[index] = productModel;
  // }

  // addProduct(ProductModel productModel) {
  //   products.add(productModel);
  // }
}
