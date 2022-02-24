import 'package:hubii_test/features/suppliers_on_map/data/models/address_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:meta/meta.dart';

class CustomerModel extends Customer {
  CustomerModel({
    @required int id,
    @required AddressModel address,
    @required String name,
  }) : super(id: id, address: address, name: name);

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      address: AddressModel.fromJson(json['address']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'name': name,
    };
  }
}
