import 'package:get/get.dart';
import 'package:getx_lesson_one/models/product_model.dart';

import '../data/products_data.dart';


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

  editProduct(ProductModel productModel, int index) {
    products[index] = productModel;
    update();
  }

  addProduct(ProductModel productModel) {
    products.add(productModel);
    update();
  }
}
