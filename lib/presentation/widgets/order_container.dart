
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.order, required this.indexId,
  });

  final Orders order;
  final int indexId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order $indexId',
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Id : ${order.orderId}'),
          Text('Total products : ${order.productsCount}'),
          Text('Order total : ${order.totalAmount}'),
          Text('Retailer : ${order.retailerName}'),
        ],
      ),
    );
  }
}
