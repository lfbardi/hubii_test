import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';

abstract class SuppliersRepository {
  Future<Either<Failure, List<Supplier>>> getAllSuppliers();
}
