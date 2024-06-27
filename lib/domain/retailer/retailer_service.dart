import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/retailer/retailer_model/retailer_model.dart';
import 'package:dartz/dartz.dart';

abstract class RetailerService{
  Future<Either<MainFailure, List<Retailer>>> getRetailers();
}