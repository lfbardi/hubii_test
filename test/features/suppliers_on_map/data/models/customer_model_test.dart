import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hubii_test/features/suppliers_on_map/data/models/address_model.dart';
import 'package:hubii_test/features/suppliers_on_map/data/models/customer_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final addressModel = AddressModel(
    street: 'street',
    state: 'state',
    city: 'city',
    country: 'country',
    number: '123',
    neighborhood: 'downtown',
    lat: 1.0,
    long: -1.0,
  );

  final testCustomerModel = CustomerModel(
    id: 1,
    name: 'name',
    address: addressModel,
  );

  test('should be a subclass of Customer entity', () {
    expect(testCustomerModel, isA<Customer>());
  });

  group('fromJson', () {
    test('should return a valid Customer model from JSON', () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('customer.json'));

      final result = CustomerModel.fromJson(jsonMap);

      expect(result, testCustomerModel);
    });
  });
}
