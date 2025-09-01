import 'package:bloc_dio/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

/// Base state
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ProductInitial extends ProductState {}

/// Loading state
class ProductLoading extends ProductState {}

/// Loaded product list successfully
class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  const ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

/// Loaded single product successfully
class ProductDetailLoaded extends ProductState {
  final ProductModel product;

  const ProductDetailLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

/// Error state
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
