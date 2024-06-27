import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:apps_now/domain/user/cart_model/cart_service.dart';
import 'package:apps_now/infrastructure/user/user_cart_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'cart_list_event.dart';
part 'cart_list_state.dart';
part 'cart_list_bloc.freezed.dart';

@injectable
class CartListBloc extends Bloc<CartListEvent, CartListState> {
  final CartService cartService;
  CartListBloc(this.cartService) : super(CartListState.initial()) {
    on<Initialize>((event, emit) async{
      emit(const CartListState(cartList: [], isLoading: true, hasError: false));

      final result = await cartService.getCartList(userName: event.userName, retailerName: event.retailerName);
      result.fold((MainFailure f) {
        emit(
          const CartListState(cartList: [], isLoading: false, hasError: true)
        );
      }, (List<Cart> r) {
        emit(
          CartListState(cartList: r, isLoading: false, hasError: false)
        );
      });
    });
  }
}
