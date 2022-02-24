import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_customers.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_suppliers.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SuppliersOnMapBloc
    extends Bloc<SuppliersOnMapEvent, SuppliersOnMapState> {
  final GetAllCustomers getAllCustomers;
  final GetAllSuppliers getAllSuppliers;

  SuppliersOnMapBloc({
    @required this.getAllCustomers,
    @required this.getAllSuppliers,
  });

  @override
  SuppliersOnMapState get initialState => InitialSuppliersOnMapState();

  @override
  Stream<SuppliersOnMapState> mapEventToState(
      SuppliersOnMapEvent event) async* {
    if (event is GetAllCustomersEvent) {
      yield LoadingSuppliersOnMapState();

      final customersEither = await getAllCustomers.call(NoParams());

      yield* customersEither.fold(
        (failure) async* {
          yield FailureSuppliersOnMapState();
        },
        (customers) async* {
          yield SuccessLoadingCustomersSuppliersOnMapState(
            customers: customers,
          );
        },
      );
    } else if (event is FindAllNearSuppliersEvent) {
      yield LoadingSuppliersOnMapState();

      final suppliersEither = await getAllSuppliers.call(NoParams());

      yield* suppliersEither.fold(
        (failure) async* {
          yield FailureSuppliersOnMapState();
        },
        (suppliers) async* {
          yield SuccessSuppliersOnMapState(
            customer: event.customer,
            suppliers: suppliers,
          );
        },
      );
    }
  }
}
