import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../repositories/products_repository.dart';

class HomeController extends GetxController {
  List<ProductModel> products = [];
  final repository = ProductsRepository();

  populateProducts() {
    products = repository.getProducts();
    update();
  }

  removeProduct(int index) {
    products.removeAt(index);
    update();
  }

  editProduct(int index) {
    for (int i = 0; i <= products.length; i++) {
      if (index == i) {
        final productModel = ProductModel(
          title: 'Italo',
          type: 'Humano',
          description: 'Estagiario',
          filename: '1.jpg',
          height: 44,
          width: 299,
          price: 20,
          rating: 5,
        );
        products[i] = productModel;
      }
    }
    update();
  }

  editProduct2(ProductModel productModel, int index) {
    products[index] = productModel;
    update();
  }
}
