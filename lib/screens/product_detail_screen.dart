import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Product? product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.npoint.io/7fe4c3d8d85298ece626/${widget.productId}'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          product = Product.fromJson(data);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load product details');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product?.name ?? 'Product Details'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : product == null
              ? const Center(child: Text('Product not found'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product!.imageUrl,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 300,
                            child: Center(child: Icon(Icons.error)),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product!.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${product!.price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product!.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}