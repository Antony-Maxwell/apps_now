import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_count_event.dart';
part 'cart_count_state.dart';

class CartCountBloc extends Bloc<CartCountEvent, CartCountState> {
  CartCountBloc() : super(CartCountInitial()) {
    on<Increment>((event, emit) {
      return emit(CartCountState(cartCount: state.cartCount+1));
    });

    on<Decrement>((event, emit) {
      return emit(CartCountState(cartCount: state.cartCount-1));
    });

    on<ResetCart>((event, emit) {
      return emit(CartCountInitial());
    });
  }
}
