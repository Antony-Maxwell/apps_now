part of 'orders_bloc.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState({
    required List<Orders> ordersList,
    required bool isLoading,
    required bool hasError,
  }) = _OrdersState;

  factory OrdersState.initial() => const OrdersState(
        ordersList: [],
        hasError: false,
        isLoading: false,
      );
}
