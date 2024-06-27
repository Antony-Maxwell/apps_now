import 'package:apps_now/application/bloc/products_bloc.dart';
import 'package:apps_now/application/cart/bloc/cart_list_bloc.dart';
import 'package:apps_now/application/cartquantity/cart_count_bloc.dart';
import 'package:apps_now/application/retailers/bloc/retailers_bloc.dart';
import 'package:apps_now/domain/core/di/injectable.dart';
import 'package:apps_now/presentation/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
        BlocProvider(create: (context) => getIt<RetailersBloc>(),),
        BlocProvider(create: (context) => getIt<CartListBloc>(),),
        BlocProvider<CartCountBloc>(create: (context) => CartCountBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 237, 231, 250),
        ),
      ),
    );
  }
}
