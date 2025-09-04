import 'package:bloc_dio/functionality/product/data/product_repository.dart';
import 'package:bloc_dio/functionality/product/logic/cubit/product_cubit.dart';
import 'package:bloc_dio/functionality/product/logic/cubit/product_state.dart';
import 'package:bloc_dio/functionality/product/presentation/productdetal.dart';
import 'package:bloc_dio/functionality/product/presentation/widgets/header_row.dart';
import 'package:bloc_dio/functionality/product/presentation/widgets/promotional_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(ProductRepository())..fetchProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: HeaderRow(userName: "Kali"),
            ),
            const PromotionalBanner(),
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: ListTile(
                            title: Text(product.title),
                            subtitle: Text(product.category),
                            trailing: const Icon(Icons.arrow_forward),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<ProductCubit>(),
                                    child: ProductDetailPage(
                                      productId: product.id,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
