import 'package:apps_now/application/bloc/products_bloc.dart';
import 'package:apps_now/application/retailers/bloc/retailers_bloc.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/widgets/custom_appbar.dart';
import 'package:apps_now/presentation/widgets/custom_bottom.dart';
import 'package:apps_now/presentation/widgets/custom_carousel.dart';
import 'package:apps_now/presentation/widgets/custom_drawer.dart';
import 'package:apps_now/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String description = "We’re India’s No. 1 Channel Management Platform that allows to connect, interact and transact across the ecosystem efficiently and reliably.";

  @override
  Widget build(BuildContext context) {
    SharedPrefsHelper().setLastVisitedScreen("homeScreen");
    BlocProvider.of<ProductsBloc>(context)
        .add(const ProductsEvent.initializa());

    BlocProvider.of<RetailersBloc>(context).add(const RetailersEvent.initialize());
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        key: _scaffoldKey,
        body: BlocBuilder<RetailersBloc, RetailersState>(
            builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while fetching the retailer data'),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(isCart: false ,scaffoldKey: _scaffoldKey, isMainScreen: true, title: 'AppsNow'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomCarousel(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        description,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const Text(
                        'Retailers',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.reatailersList.length,
                        itemBuilder: (context, index) {
                          final retailer = state.reatailersList[index];
                          return CustomListTile(retailer: retailer);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }),
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}
