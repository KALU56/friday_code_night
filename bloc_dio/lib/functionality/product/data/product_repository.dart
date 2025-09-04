import 'package:dio/dio.dart';


import 'models/product_model.dart';

class ProductRepository {
  final Dio _dio;

  ProductRepository({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: "https://dummyjson.com"));

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get('/products');

      final List products = response.data['products'];

      return products.map((json) => ProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  Future<ProductModel> fetchProductById(int id) async {
    try {
      final response = await _dio.get('/products/$id');

      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load product with id $id: ${e.message}');
    }
  }
}
