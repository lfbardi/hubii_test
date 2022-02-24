import 'package:dartz/dartz.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/address.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/entities/supplier.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/suppliers_repository.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_suppliers.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSuppliersRepository extends Mock implements SuppliersRepository {}

void main() {
  GetAllSuppliers usecase;
  MockSuppliersRepository mockSuppliersRepository;

  setUp(() {
    mockSuppliersRepository = MockSuppliersRepository();
    usecase = GetAllSuppliers(mockSuppliersRepository);
  });

  final testSupplierList = <Supplier>[
    Supplier(
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
      range: 3.5,
    )
  ];

  test('should get all suppliers list from the repository', () async {
    when(mockSuppliersRepository.getAllSuppliers())
        .thenAnswer((_) async => Right(testSupplierList));

    final result = await usecase(NoParams());

    expect(result, Right(testSupplierList));
    verify(mockSuppliersRepository.getAllSuppliers());
    verifyNoMoreInteractions(mockSuppliersRepository);
  });
}
