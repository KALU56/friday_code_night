import 'package:bloc_dio/data/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;

  ProductCubit(this._repository) : super(ProductInitial());

  /// Fetch all products
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await _repository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  /// Fetch single product detail
  Future<void> fetchProductDetail(int id) async {
    emit(ProductLoading());
    try {
      final product = await _repository.fetchProductById(id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
