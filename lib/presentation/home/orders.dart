import 'package:apps_now/application/retailers/bloc/retailers_bloc.dart';
import 'package:apps_now/presentation/home/detailed_orders.dart';
import 'package:apps_now/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RetailersBloc, RetailersState>(
          builder: (context, state) {
            if(state.isLoading){
              return const CircularProgressIndicator();
            }else if(state.hasError){
              return const Center(child: Text('Error'),);
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomAppBar(
                    isProd: false,
                      scaffoldKey: scaffoldKey,
                      isMainScreen: false,
                      title: "Retailers",
                      isCart: false),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final retailers = state.reatailersList[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListTile(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedOrdersScreen(retailerName: retailers.retailerName, userName: retailers.userName!,))),
                          leading: const CircleAvatar(radius: 25,),
                          title: Text(retailers.retailerName, style: const TextStyle(fontSize: 20),),
                        )
                        );
                    }, separatorBuilder: (context, index) => const Divider(), itemCount: state.reatailersList.length)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
