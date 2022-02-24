import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';

abstract class CustomersRepository {
  Future<Either<Failure, Customer>> getAllCustomers();
}
