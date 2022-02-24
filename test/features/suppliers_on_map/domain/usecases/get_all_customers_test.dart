import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/address.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/customer.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/customers_repository.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_customers.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCustomersRepository extends Mock implements CustomersRepository {}

void main() {
  GetAllCustomers usecase;
  MockCustomersRepository mockCustomersRepository;

  setUp(() {
    mockCustomersRepository = MockCustomersRepository();
    usecase = GetAllCustomers(mockCustomersRepository);
  });

  final testCustomersList = <Customer>[
    Customer(
      id: 1,
      address: Address(
        street: 'street',
        state: 'state',
        city: 'city',
        country: 'country',
        number: '123',
        neighborhood: 'downtown',
        lat: 1,
        long: -1,
      ),
      name: 'customer',
    )
  ];

  test('should get all customers list from the repository', () async {
    when(mockCustomersRepository.getAllCustomers())
        .thenAnswer((_) async => Right(testCustomersList));

    final result = await usecase(NoParams());

    expect(result, Right(testCustomersList));
    verify(mockCustomersRepository.getAllCustomers());
    verifyNoMoreInteractions(mockCustomersRepository);
  });
}
