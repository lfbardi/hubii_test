import 'package:hubii_test/core/error/exceptions.dart';
import 'package:hubii_test/features/suppliers_on_map/data/datasources/customer_remote_data_source.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/customers_repository.dart';
import 'package:meta/meta.dart';

class CustomersRepositoryImpl implements CustomersRepository {
  final CustomerRemoteDataSource customerRemoteDataSource;

  CustomersRepositoryImpl({
    @required this.customerRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Customer>>> getAllCustomers() async {
    try {
      final remoteCustomers = await customerRemoteDataSource.getAllCustomers();
      return Right(remoteCustomers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
