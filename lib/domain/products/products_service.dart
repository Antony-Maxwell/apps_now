import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:dartz/dartz.dart';
import 'package:apps_now/domain/core/failures/failures.dart';

abstract class ProductService {
  Future<Either<MainFailure, List<Product>>> getProducts();
}
