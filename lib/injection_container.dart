import 'package:get_it/get_it.dart';
import 'package:hubii_test/features/suppliers_on_map/data/datasources/customer_remote_data_source.dart';
import 'package:hubii_test/features/suppliers_on_map/data/datasources/supplier_remote_data_source.dart';
import 'package:hubii_test/features/suppliers_on_map/data/repositories/customers_repository_impl.dart';
import 'package:hubii_test/features/suppliers_on_map/data/repositories/suppliers_repositoiry_impl.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/customers_repository.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/repositories/suppliers_repository.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_customers.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_suppliers.dart';
import 'package:hubii_test/features/suppliers_on_map/presentation/bloc/bloc.dart';
import 'package:http/http.dart' as http;

final get = GetIt.instance;

void init() {
  //bloc
  get.registerFactory(
    () => SuppliersOnMapBloc(
      getAllCustomers: get(),
      getAllSuppliers: get(),
    ),
  );

  //usecases
  get.registerLazySingleton(() => GetAllCustomers(get()));
  get.registerLazySingleton(() => GetAllSuppliers(get()));

  //repositories
  get.registerLazySingleton<CustomersRepository>(
      () => CustomersRepositoryImpl(customerRemoteDataSource: get()));
  get.registerLazySingleton<SuppliersRepository>(
      () => SuppliersRepositoryImpl(supplierRemoteDataSource: get()));

  //datasources
  get.registerLazySingleton<CustomerRemoteDataSource>(
      () => CustomerRemoteDataSourceImpl(client: get()));
  get.registerLazySingleton<SupplierRemoteDataSource>(
      () => SupplierRemoteDataSourceImpl(client: get()));

  //http
  get.registerLazySingleton(() => http.Client());
}
