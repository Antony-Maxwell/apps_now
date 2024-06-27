part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required List<Product> productList,
    required bool isLoading,
    required bool hasError,
  }) = _ProductsState;

  factory ProductsState.initial() => const ProductsState(
        productList: [],
        hasError: false,
        isLoading: false,
      );
}
