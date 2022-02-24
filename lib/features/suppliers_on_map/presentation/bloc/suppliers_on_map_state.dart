import 'package:equatable/equatable.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SuppliersOnMapState extends Equatable {
  SuppliersOnMapState([List props = const <dynamic>[]]) : super(props);
}

class InitialSuppliersOnMapState extends SuppliersOnMapState {}

class LoadingSuppliersOnMapState extends SuppliersOnMapState {}

class SuccessLoadingCustomersSuppliersOnMapState extends SuppliersOnMapState {
  final List<Customer> customers;

  SuccessLoadingCustomersSuppliersOnMapState({
    @required this.customers,
  }) : super([customers]);
}

class SuccessSuppliersOnMapState extends SuppliersOnMapState {
  final List<Supplier> suppliers;
  final Customer customer;

  SuccessSuppliersOnMapState({
    @required this.suppliers,
    @required this.customer,
  }) : super([suppliers, customer]);
}

class FailureSuppliersOnMapState extends SuppliersOnMapState {}
