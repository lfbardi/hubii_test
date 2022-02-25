import 'package:flutter_test/flutter_test.dart';
import 'package:hubii_test/features/suppliers_on_map/data/models/supplier_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/address.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';

void main() {
  final testSupplierModel = SupplierModel(
    id: 1,
    address: Address(
      street: 'street',
      state: 'state',
      city: 'city',
      country: 'country',
      number: '123',
      neighborhood: 'downtown',
      lat: 1,
      long: -1,
    ),
    name: 'customer',
    range: 3.5,
  );

  test('should be a subclass of Supplier entity', () {
    expect(testSupplierModel, isA<Supplier>());
  });
}
