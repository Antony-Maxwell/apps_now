
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/presentation/home/detailed_screen.dart';
import 'package:flutter/material.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(product: product),)),
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius:
                        BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://wallpaperaccess.com/full/1624960.jpg"),
                        fit: BoxFit.cover)),
              ),
              Text(
                product.prodName!,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text("\$${product.prodRkPrice}", style: const TextStyle(fontWeight: FontWeight.bold),),
              Text("Code : ${product.prodCode}")
            ],
          ),
        ),
      ),
    );
  }
}
