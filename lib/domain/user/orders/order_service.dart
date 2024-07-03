import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderService{
  Future<Either<MainFailure, List<Orders>>> getOrderList({
    required String userName,
    required String retailerName,
  });
}