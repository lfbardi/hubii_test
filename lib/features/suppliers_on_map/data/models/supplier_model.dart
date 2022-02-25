import 'package:hubii_test/features/suppliers_on_map/data/models/address_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/address.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:meta/meta.dart';

class SupplierModel extends Supplier {
  SupplierModel({
    @required int id,
    @required Address address,
    @required String name,
    @required double range,
  }) : super(id: id, address: address, name: name, range: range);

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    if (json['address'] == null ||
        json['id'] == null ||
        json['id'] is! int ||
        json['name'] == null ||
        json['range'] == null) return null;
    return SupplierModel(
      id: json['id'],
      address: AddressModel.fromJson(json['address']),
      name: json['name'] as String,
      range: json['range'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'name': name,
      'range': range,
    };
  }
}
