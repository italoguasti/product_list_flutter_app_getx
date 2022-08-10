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
}
