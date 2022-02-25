import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  final Set<Marker> markers;
  final Customer customer;

  SuccessSuppliersOnMapState({
    @required this.suppliers,
    @required this.customer,
    @required this.markers,
  }) : super([suppliers, customer, markers]);
}

class FailureSuppliersOnMapState extends SuppliersOnMapState {}
