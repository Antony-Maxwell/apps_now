import 'package:apps_now/domain/core/failures/failures.dart';
import 'package:apps_now/domain/retailer/retailer_model/retailer_model.dart';
import 'package:apps_now/domain/retailer/retailer_service.dart';
import 'package:apps_now/infrastructure/retailer/retailer_sqflite.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'retailers_event.dart';
part 'retailers_state.dart';
part 'retailers_bloc.freezed.dart';


@injectable
class RetailersBloc extends Bloc<RetailersEvent, RetailersState> {
  // final RetailerDatabaseHelper retailDbHelper;
  final RetailerService retailerService;
  RetailersBloc(this.retailerService) : super(RetailersState.initial()) {
    on<Initialize>((event, emit) async{
      emit(const RetailersState(reatailersList: [], isLoading: true, hasError: false));

      //fetch all retailers
        final  retailers = await retailerService.getRetailers();
        retailers.fold((MainFailure f) {
          emit(
            const RetailersState(reatailersList: [], isLoading: false, hasError: true)
          );
        }, (List<Retailer> r) {
          emit(
            RetailersState(reatailersList: r, isLoading: false, hasError: false)
          );
        });
    });
  }
}
