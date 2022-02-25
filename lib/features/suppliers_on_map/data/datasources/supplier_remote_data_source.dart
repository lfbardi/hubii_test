import 'dart:convert';

import 'package:hubii_test/core/error/exceptions.dart';
import 'package:hubii_test/features/suppliers_on_map/data/models/supplier_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class SupplierRemoteDataSource {
  Future<List<Supplier>> getAllSuppliers();
}

class SupplierRemoteDataSourceImpl implements SupplierRemoteDataSource {
  final http.Client client;

  SupplierRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<Supplier>> getAllSuppliers() async {
    final response = await client.get(
      Uri.parse('https://61f16556072f86001749f1b7.mockapi.io/api/v1/suppliers'),
    );
    if (response.statusCode == 200) {
      final suppliersJsonList = jsonDecode(response.body) as List;

      return Future.value(suppliersJsonList
          .map((supplier) => SupplierModel.fromJson(supplier))
          .toList());
    } else {
      throw ServerException();
    }
  }
}
