part of 'cart_list_bloc.dart';

@freezed
class CartListState with _$CartListState {
  const factory CartListState(
    {
      required List<Cart> cartList,
      required bool isLoading,
      required bool hasError,

    }
  ) = _CartListState;

  factory CartListState.initial() => const CartListState(
    cartList: [],
    hasError: false,
    isLoading: false,
  );
}
