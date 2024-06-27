import 'package:apps_now/application/cart/bloc/cart_list_bloc.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/widgets/cart_container.dart';
import 'package:apps_now/presentation/widgets/confirm_order_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen(
      {super.key, required this.userName, required this.retailerName});

  final String userName;
  final String retailerName;

  @override
  Widget build(BuildContext context) {
    SharedPrefsHelper().setLastVisitedScreen("cartScreen");
    BlocProvider.of<CartListBloc>(context).add(CartListEvent.initialize(
        userName: userName, retailerName: retailerName));
    return SafeArea(
        child: Scaffold(body: SingleChildScrollView(
      child: BlocBuilder<CartListBloc, CartListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while fetching the cart'),
            );
          } else {
            if (state.cartList.isEmpty) {
              return const Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    Text(
                      'Cart is Empty......!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Cart',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.cartList.length,
                        separatorBuilder: (context, index) {
                          return const Column(children: [
                            SizedBox(
                              height: 5,
                            ),
                            Divider()
                          ]);
                        },
                        itemBuilder: (context, index) {
                          final cart = state.cartList[index];
                          return CartContainer(
                              cart: cart,
                              userName: userName,
                              retailerName: retailerName);
                        })
                  ],
                ),
              ),
            );
          }
        },
      ),
    ), bottomNavigationBar: ConfirmOrderButtn(userName: userName, retailerName: retailerName)));
  }
}
