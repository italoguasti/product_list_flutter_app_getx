import '../models/product_model.dart';

abstract class IProductsRepository {
  Future<List<ProductModel>> findAllProducts();

  // Future<void> saveThisProduct(ProductModel productModel);

  Future<void> removeThisProduct(ProductModel productModel);

}
