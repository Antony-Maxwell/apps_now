
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
    required this.retailerName, required this.totalAmount,
  });

  final Cart cart;
  final String userName;
  final String retailerName;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
  double doubleValue = double.parse(totalAmount);
  String formattedValue = doubleValue.toStringAsFixed(2);
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
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    cart.retailerName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(" ₹ $formattedValue", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      CartQtyUpdation(
                        productName: cart.productName,
                        price: cart.productPrice,
                        quantity:
                            int.parse(cart.cartQuantity),
                      ),
                      const SizedBox(width: 50,),
                      GestureDetector(
                        onTap: () async {
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
                        child: Container(
                          height: 40,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(Icons.delete_forever),
                          ),
                        ),
                      )
                    ],
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
