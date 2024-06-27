part of 'cart_list_bloc.dart';

@freezed
class CartListEvent with _$CartListEvent {
  const factory CartListEvent.initialize(
    {
      required String userName,
      required String retailerName,
    }
  ) = Initialize;
}