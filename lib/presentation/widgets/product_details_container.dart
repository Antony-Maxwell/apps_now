
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:flutter/material.dart';

class ProductDetailsContaienr extends StatelessWidget {
  const ProductDetailsContaienr({
    super.key,
    required this.product,
    required this.description,
  });

  final Product product;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Text(
        product.prodName!,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(product.prodShortName!),
      Text('product code : ${product.prodCode}'),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Price : \$${product.prodRkPrice}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const Divider(),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'Description',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        description,
      )
    ]));
  }
}