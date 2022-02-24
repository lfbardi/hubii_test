import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/suppliers_repository.dart';

class GetAllSuppliers implements UseCase<List<Supplier>, NoParams> {
  final SuppliersRepository repository;

  GetAllSuppliers(this.repository);

  @override
  Future<Either<Failure, List<Supplier>>> call(NoParams params) async {
    return await repository.getAllSuppliers();
  }
}
