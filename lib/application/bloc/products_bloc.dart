import 'dart:developer';

import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/domain/products/products_service.dart';
import 'package:apps_now/infrastructure/products/products_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductService _productService;
  final ProductsHelper  _productsHelper = ProductsHelper();
  ProductsBloc(this._productService) : super(ProductsState.initial()) {
    on<Initialize>((event, emit) async{
      emit(const ProductsState(productList: [], isLoading: true, hasError: false));

      //checking if the data exist or not in the db
      final existingProducts = await _productsHelper.getAllProducts();
      if(existingProducts.isNotEmpty){
        log('products already in db');
        emit(ProductsState(productList: existingProducts, isLoading: false, hasError: false));
        return;
      }

      //fetch data
      final _result = await _productService.getProducts();
      _result.fold((MainFailure f) {
        emit(
          const ProductsState(productList: [], isLoading: false, hasError: true)
        );
      }, (List<Product> r) async{
        emit(
          ProductsState(productList: r, isLoading: false, hasError: false)
        );
        await _productsHelper.insertProducts(r);
      });
    });
  }
}
