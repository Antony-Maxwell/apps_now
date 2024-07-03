part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.initialize(
    {
      required String userName,
      required String retailerName,
    }
  ) = Initialize;
}