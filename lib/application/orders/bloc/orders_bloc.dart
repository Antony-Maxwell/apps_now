import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/user/orders/order_service.dart';
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderService orderService;
  OrdersBloc(this.orderService) : super(OrdersState.initial()) {
    on<Initialize>((event, emit) async{
      emit(const OrdersState(ordersList: [], isLoading: true, hasError: false));

      final result = await orderService.getOrderList(userName: event.userName, retailerName: event.retailerName);
      result.fold((MainFailure f) {
        emit(
          const OrdersState(ordersList: [], isLoading: false, hasError: true)
        );
      }, (List<Orders> r) {
        emit(
          OrdersState(ordersList: r, isLoading: false, hasError: false)
        );
      });
    });
  }
}
