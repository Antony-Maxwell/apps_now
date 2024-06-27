
import 'package:apps_now/application/cart/bloc/cart_list_bloc.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:apps_now/infrastructure/user/user_cart_helper.dart';
import 'package:apps_now/presentation/widgets/quantity_updation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.cart,
    required this.userName,
    required this.retailerName,
  });

  final Cart cart;
  final String userName;
  final String retailerName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: double.infinity,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(15),
                  child: Image.network(
                    "https://wallpaperaccess.com/full/1624960.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.productName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Retailer : ${cart.retailerName}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Quantity : ${cart.cartQuantity}'),
                  const SizedBox(
                    height: 25,
                  ),
                  CartQtyUpdation(
                    productName: cart.productName,
                    price: cart.productPrice,
                    quantity:
                        int.parse(cart.cartQuantity),
                  ),
                  TextButton(
                      onPressed: () async {
                        await CartDatabaseHelper()
                            .deleteCart(userName,
                                cart.productName);
                        BlocProvider.of<CartListBloc>(
                                context)
                            .add(CartListEvent
                                .initialize(
                                    userName: userName,
                                    retailerName:
                                        retailerName));
                      },
                      child: const Text('Remove'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
