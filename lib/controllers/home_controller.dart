import 'package:get/get.dart';
import 'package:getx_lesson_one/exceptions/exceptions.dart';
import 'package:getx_lesson_one/models/product_model.dart';
import 'package:getx_lesson_one/theme/app_colors.dart';

import '../data/products_repository.dart';

class HomeController extends GetxController {
  final repository = ProductsRepository();
  //Gerenciar
  final Rx<List<ProductModel>> _products = Rx([]);
  //Acessar lista
  Stream<List<ProductModel>> get productsStream => _products.stream;

  Future<void> findProducts() async {
    try {
      _products.value = await repository.findAllProducts();
    } on NotFoundException catch (e) {
      Get.snackbar(
        'Error',
        e.errorMessage,
        backgroundColor: AppColors.lightPurple.withOpacity(0.5),
      );
    }
    _products.refresh();
  }

  Future<void> removeProduct(ProductModel product) async {
    try {
      await repository.removeThisProduct(product);
      _products.value
          .removeWhere((currentProduct) => currentProduct.id == product.id);
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Error',
        e.errorMessage,
        backgroundColor: AppColors.lightPurple.withOpacity(0.5),
      );
    }
    _products.refresh();
  }

  Future<void> addProduct(ProductModel product) async {
    try {
      final addProduct = await repository.addThisProduct(product);
      _products.value.add(addProduct);
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Error',
        e.errorMessage,
        backgroundColor: AppColors.lightPurple.withOpacity(0.5),
      );
    }
    _products.refresh();
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      int index = _products.value.indexWhere((p) => p.id == product.id);

      final updatedProduct = await repository.updateThisProduct(product);
      _products.value[index] = updatedProduct;
    } on UnauthorizedException catch (e) {
      Get.snackbar(
        'Error',
        e.errorMessage,
        backgroundColor: AppColors.lightPurple.withOpacity(0.5),
      );
    }
    _products.refresh();
  }

  //Método save apenas para observação (não está sendo utilizado)
  // Future<void> saveProduct(ProductModel product) async {
  //   final savedProduct = await repository.saveThisProduct(product);
  //   final index = _products.value.indexWhere((e) => e.id == product.id);
  //   final existElement = index != -1;
  //   if (existElement) {
  //     _products.value[index] = savedProduct;
  //   } else {
  //     _products.value.add(savedProduct);
  //   }
  //   _products.refresh();
  // }
}
