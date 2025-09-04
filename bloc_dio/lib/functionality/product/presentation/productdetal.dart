import 'package:bloc_dio/functionality/product/logic/cubit/product_cubit.dart';
import 'package:bloc_dio/functionality/product/logic/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetailPage extends StatelessWidget {
  final int productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().fetchProductDetail(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductDetailLoaded) {
            final product = state.product;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text(product.description,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Text('Category: ${product.category}',
                      style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Price: \$${product.price}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Discount: ${product.discountPercentage}%',
                      style: const TextStyle(
                          fontSize: 18, color: Colors.orange)),
                  const SizedBox(height: 10),
                  Text('Stock: ${product.stock}',
                      style: const TextStyle(
                          fontSize: 18, color: Colors.blueGrey)),
                ],
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
