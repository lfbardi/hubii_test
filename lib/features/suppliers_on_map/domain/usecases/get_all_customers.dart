import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/error/failures.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/customers_repository.dart';

class GetAllCustomers implements UseCase<List<Customer>, NoParams> {
  final CustomersRepository repository;

  GetAllCustomers(this.repository);

  @override
  Future<Either<Failure, List<Customer>>> call(NoParams params) async {
    return await repository.getAllCustomers();
  }
}
