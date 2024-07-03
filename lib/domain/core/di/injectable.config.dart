// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/bloc/products_bloc.dart' as _i10;
import '../../../application/cart/bloc/cart_list_bloc.dart' as _i14;
import '../../../application/orders/bloc/orders_bloc.dart' as _i7;
import '../../../application/retailers/bloc/retailers_bloc.dart' as _i13;
import '../../../infrastructure/products/products_impl.dart' as _i9;
import '../../../infrastructure/retailer/retailer_sqflite.dart' as _i12;
import '../../../infrastructure/user/user_cart_helper.dart' as _i4;
import '../../../infrastructure/user/user_order_helper.dart' as _i6;
import '../../products/products_service.dart' as _i8;
import '../../retailer/retailer_service.dart' as _i11;
import '../../user/cart_model/cart_service.dart' as _i3;
import '../../user/orders/order_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CartService>(() => _i4.CartDatabaseHelper());
  gh.lazySingleton<_i5.OrderService>(() => _i6.OrderDatabaseHelper());
  gh.factory<_i7.OrdersBloc>(() => _i7.OrdersBloc(get<_i5.OrderService>()));
  gh.lazySingleton<_i8.ProductService>(() => _i9.ProductsImplementations());
  gh.factory<_i10.ProductsBloc>(
      () => _i10.ProductsBloc(get<_i8.ProductService>()));
  gh.lazySingleton<_i11.RetailerService>(() => _i12.RetailerDatabaseHelper());
  gh.factory<_i13.RetailersBloc>(
      () => _i13.RetailersBloc(get<_i11.RetailerService>()));
  gh.factory<_i14.CartListBloc>(
      () => _i14.CartListBloc(get<_i3.CartService>()));
  return get;
}
