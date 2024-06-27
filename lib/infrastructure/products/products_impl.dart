import 'dart:developer';

import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/domain/products/products_service.dart';
import 'package:apps_now/infrastructure/strings.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductService)
class ProductsImplementations implements ProductService {
  @override
  Future<Either<MainFailure, List<Product>>> getProducts() async {
    try {
      final Response response = await Dio(BaseOptions()).get(baseUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final productsList = (response.data['data']['products'] as List).map((e) {
          return Product.fromJson(e);
        }).toList();

        log("totally ${productsList.length} found");
        return Right(productsList);
      } else {
        print('errorrrrrrr');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
