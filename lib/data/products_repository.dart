import 'package:dio/dio.dart';
import 'package:getx_lesson_one/data/i_products_repository.dart';
import 'package:getx_lesson_one/models/product_model.dart';

class ProductsRepository implements IProductsRepository {
  final Dio _dio;

  ProductsRepository(this._dio);

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final response = await _dio.get(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json');
      if (response.data == 'null') {
        return [];
      }
      final List<ProductModel> list = [];
      (response.data as Map).forEach(
        (key, value) {
          final product = ProductModel.fromMap({...value, 'id': key});
          list.add(product);
        },
      );
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> addThisProduct(ProductModel product) async {
    final response = await _dio.post(
      'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json',
      data: product.toMap(),
    );

    final id = response.data['name'];
    return ProductModel(
      id: id,
      title: product.title,
      type: product.type,
      description: product.description,
      price: product.price,
      rating: product.rating,
      date: product.date,
    );
  }

  @override
  Future<ProductModel> updateThisProduct(ProductModel product) async {
    await _dio.put(
      'https://getx-lesson-one-default-rtdb.firebaseio.com/products/${product.id}.json',
      data: product.toMap(),
    );
    return product;
  }

  @override
  Future<ProductModel> removeThisProduct(ProductModel product) async {
    try {
      await _dio.delete(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/products/${product.id}.json');
      return product;
    } catch (e) {
      throw Exception('Failed to delet product: ${product.id}');
    }
  }

  //Método save apenas para observação (não está sendo utilizado)
  // @override
  // Future<ProductModel> saveThisProduct(ProductModel product) async {
  //   if (product.id.isNotEmpty) {
  //     //create functions
  //     return updateThisProduct(product);
  //   } else {
  //     //create functions
  //     return addThisProduct(product);
  //   }
  // }
}
