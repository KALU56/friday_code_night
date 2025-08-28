import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_dio/cart_model.dart';

// Your Cart model goes here (use the one you already created)

final dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

Future<Cart?> fetchProduct(int id) async {
  try {
    final response = await dio.get('/products/$id');
    if (response.statusCode == 200) {
      return Cart.fromJson(response.data);
    }
  } on DioException catch (e) {
    print('Error fetching product: ${e.message}');
  }
  return null;
}
Future<void> createProduct(Map<String, dynamic> productData) async {
  try {
    final response = await dio.post(
      '/products/add', // replace with actual POST endpoint
      data: productData,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Product created successfully: ${response.data}');
    }
  } on DioException catch (e) {
    print('Error creating product: ${e.message}');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductDisplay(),
    );
  }
}

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  Cart? product;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

  Future<void> loadProduct() async {
    final p = await fetchProduct(1); // fetch product with id 1
    setState(() {
      product = p;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (product == null) {
      return const Scaffold(
        body: Center(child: Text('Failed to load product')),
      );
    }

    // Display product info as simple text
    return Scaffold(
  appBar: AppBar(title: const Text('Product Info')),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title: ${product!.title}\n\n'
            'Description: ${product!.description}\n\n'
            'Price: \$${product!.price}\n\n'
            'Category: ${product!.category}\n\n'
            'Brand: ${product!.brand}\n\n'
            'Images: ${product!.images.join(', ')}\n\n'
            'Rating: ${product!.rating}\n\n'
            'Stock: ${product!.stock}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final newProduct = {
                'title': 'New Phone',
                'description': 'Brand new phone',
                'price': 799,
                'category': 'smartphones',
                'brand': 'MyBrand',
                'images': ['https://i.dummyjson.com/data/products/1/1.jpg'],
              };
              createProduct(newProduct);
            },
            child: const Text('Add Product'),
          ),
        ],
      ),
    ),
  ),
);

  }
}
