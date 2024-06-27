part of 'retailers_bloc.dart';

@freezed
class RetailersState with _$RetailersState {
  const factory RetailersState({
    required List<Retailer> reatailersList,
    required bool isLoading,
    required bool hasError,
  }) = _RetailersState;

  factory RetailersState.initial() => const RetailersState(
    reatailersList: [], 
    isLoading: false, 
    hasError: false);
}
