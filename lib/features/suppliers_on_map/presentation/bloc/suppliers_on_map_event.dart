import 'package:equatable/equatable.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SuppliersOnMapEvent extends Equatable {
  SuppliersOnMapEvent([List props = const <dynamic>[]]) : super(props);
}

class GetAllCustomersEvent extends SuppliersOnMapEvent {}

class FindAllNearSuppliersEvent extends SuppliersOnMapEvent {
  final Customer customer;

  FindAllNearSuppliersEvent({@required this.customer}) : super([customer]);
}
