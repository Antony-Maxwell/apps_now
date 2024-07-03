import 'dart:developer';

import 'package:apps_now/application/orders/bloc/orders_bloc.dart';
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:apps_now/presentation/widgets/custom_appbar.dart';
import 'package:apps_now/presentation/widgets/order_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedOrdersScreen extends StatelessWidget {
  DetailedOrdersScreen({super.key, required this.userName, required this.retailerName});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final String userName;
  final String retailerName;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersBloc>(context).add(OrdersEvent.initialize(userName: userName, retailerName: retailerName));
    return Scaffold(
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if(state.isLoading){
            return const CircularProgressIndicator();
          }else if(state.hasError){
            return const Center(child: Text('Error'),);
          }else if(state.ordersList.isEmpty){
              return const Center(child: Text('No Orders.....!'),);
          }
          log(state.ordersList.length.toString());
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomAppBar(
                    isProd: false,
                      scaffoldKey: scaffoldKey,
                      isMainScreen: false,
                      title: "Orders",
                      isCart: false),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.ordersList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemBuilder: (context, index) {
                      final order = state.ordersList[index];
                      return
                    OrderContainer(order: order, indexId: index,);
                    }
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
