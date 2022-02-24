import 'dart:convert';

import 'package:hubii_test/core/error/exceptions.dart';
import 'package:hubii_test/features/suppliers_on_map/data/models/customer_model.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class CustomerRemoteDataSource {
  Future<List<Customer>> getAllCustomers();
}

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final http.Client client;

  CustomerRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<Customer>> getAllCustomers() async {
    final response = await client.get(
      Uri.parse('https://61f16556072f86001749f1b7.mockapi.io/api/v1/customers'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map((customer) => CustomerModel.fromJson(customer));
    } else {
      throw ServerException();
    }
  }
}
