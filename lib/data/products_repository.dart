import 'package:dio/dio.dart';
import 'package:getx_lesson_one/data/i_products_repository.dart';
import 'package:getx_lesson_one/models/product_model.dart';

class ProductsRepository implements IProductsRepository {
  final Dio _dio;
  // final List<ProductModel> _productsList = [];
  // List<ProductModel> get products => [..._productsList];

  ProductsRepository(this._dio);

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final response = await _dio.get(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json');
      if (response.data == 'null') {
        return [];
      }
        final List<ProductModel>list= [];
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
  Future<ProductModel> saveThisProduct(ProductModel product) async {
    // bool hasId = data['id'] != null;

    // final product = ProductModel(
    //   id: hasId ? data['id'] as String : Random().nextDouble().toString(),
    //   title: data['title'] as String,
    //   type: data['type'] as String,
    //   description: data['description'] as String,
    //   filename: data['filename'] as String,
    //   height: data['height'] as int,
    //   width: data['width'] as int,
    //   price: data['price'] as double,
    //   rating: data['rating'] as double,
    // );

    if (product.id.isNotEmpty) {
      //create functions
      return updateThisProduct(product);
    } else {
      //create functions
      return addThisProduct(product);
    }
  }

  @override
  Future<ProductModel> addThisProduct(ProductModel product) async {
    final response = await _dio.post(
      'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json',
      data: product.toMap(),
    );
    print(response);

    final id = response.data['name'];
    return ProductModel(
      id: id,
      title: product.title,
      type: product.type,
      description: product.description,
      price: product.price,
      rating: product.rating,
    );

    // _productsList.add(ProductModel(
    //   id: id,
    //   title: product.title,
    //   type: product.type,
    //   description: product.description,
    //   filename: product.filename,
    //   height: product.height,
    //   width: product.width,
    //   price: product.price,
    //   rating: product.rating,
    // ));
  }

  @override
  Future<ProductModel> updateThisProduct(ProductModel product) async {
    // int index = _productsList.indexWhere((p) => p.id == product.id);
    // if (index >= 0) {
    await _dio.patch(
      'https://getx-lesson-one-default-rtdb.firebaseio.com/products.json',
      data: product.toMap(),
    );
    // _productsList[index] = product;
    // }
    return product;
  }

  @override
  Future<ProductModel> removeThisProduct(ProductModel product) async {
    try {
      await _dio.delete(
          'https://getx-lesson-one-default-rtdb.firebaseio.com/${product.id}.json');
      print('Delete Success');
      return product;
    } catch (e) {
      throw Exception('Failed to delet product: ${product.id}');
    }
  }
}
