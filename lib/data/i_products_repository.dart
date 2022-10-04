import '../models/product_model.dart';

abstract class IProductsRepository {
  Future<List<ProductModel>> findAllProducts();

  Future<void> addThisProduct(ProductModel product);

  Future<void> updateThisProduct(ProductModel product);

  Future<void> removeThisProduct(ProductModel product);

  //Método save apenas para observação (não está sendo utilizado)
  // Future<void> saveThisProduct(ProductModel product);
}
