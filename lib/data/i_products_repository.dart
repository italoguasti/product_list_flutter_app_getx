import '../models/product_model.dart';

abstract class IProductsRepository {
  Future<List<ProductModel>> findAllProducts();
}
