import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartService{
  Future<Either<MainFailure, List<Cart>>> getCartList({
    required String userName,
    required String retailerName,
  });
}