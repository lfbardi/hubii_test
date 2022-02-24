import 'package:hubii_test/core/error/exceptions.dart';
import 'package:hubii_test/features/suppliers_on_map/data/datasources/supplier_remote_data_source.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/suppliers_repository.dart';
import 'package:meta/meta.dart';

class SuppliersRepositoryImpl implements SuppliersRepository {
  final SupplierRemoteDataSource supplierRemoteDataSource;

  SuppliersRepositoryImpl({
    @required this.supplierRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Supplier>>> getAllSuppliers() async {
    try {
      final remoteSuppliers = await supplierRemoteDataSource.getAllSuppliers();
      return Right(remoteSuppliers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
