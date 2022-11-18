import 'package:dio/dio.dart';
import 'package:getx_lesson_one/data/i_products_repository.dart';
import 'package:getx_lesson_one/exceptions/exceptions.dart';
import 'package:getx_lesson_one/models/product_model.dart';
import 'package:getx_lesson_one/data/secure_storage.dart';

class ProductsRepository implements IProductsRepository {
  Dio dio = Dio();
  final token = SecureStorage.readToken();

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final response = await dio.get(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json?auth=${await token}');
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
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException(
              errorMessage: e.response?.data['error'] ?? 'Fail to add product');
        case 404:
          throw NotFoundException(
              errorMessage:
                  e.response?.data['error'] ?? 'Not Found product list');
        default:
          print(e);
          rethrow;
      }
    }
  }
  // O repository tem a responsabilidade de mapear o que vem de fora pra dentro.

  @override
  Future<ProductModel> addThisProduct(ProductModel product) async {
    try {
      final response = await dio.post(
        'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json?auth=${await token}',
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
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException(
              errorMessage: e.response?.data['error'] ?? 'Fail to add product');
        default:
          throw 'an erro as ocurred';
      }
    }
  }

  @override
  Future<ProductModel> updateThisProduct(ProductModel product) async {
    try {
      await dio.put(
        'https://getx-lesson-one-default-rtdb.firebaseio.com/products/${product.id}.json?auth=${await token}',
        data: product.toMap(),
      );
      return product;
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException(
              errorMessage:
                  e.response?.data['error'] ?? 'Fail to update product');
        default:
          rethrow;
      }
    }
  }

  @override
  Future<ProductModel> removeThisProduct(ProductModel product) async {
    try {
      await dio.delete(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/products/${product.id}.json?auth=${await token}');
      return product;
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw UnauthorizedException(
              errorMessage:
                  e.response?.data['error'] ?? 'Fail to delete product');
        case 404:
          throw NotFoundException(
              errorMessage: e.response?.data['error'] ?? 'Not Found');
        default:
          rethrow;
      }
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
