import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hubii_test/core/usecases/usecase.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_customers.dart';
import 'package:hubii_test/features/suppliers_on_map/domain/usecases/get_all_suppliers.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SuppliersOnMapBloc
    extends Bloc<SuppliersOnMapEvent, SuppliersOnMapState> {
  final GetAllCustomers getAllCustomers;
  final GetAllSuppliers getAllSuppliers;

  SuppliersOnMapBloc({
    @required this.getAllCustomers,
    @required this.getAllSuppliers,
  }) : super(InitialSuppliersOnMapState());

  @override
  Stream<SuppliersOnMapState> mapEventToState(
      SuppliersOnMapEvent event) async* {
    if (event is GetAllCustomersEvent) {
      yield LoadingSuppliersOnMapState();

      final customersEither = await getAllCustomers.call(NoParams());

      yield* customersEither.fold(
        (failure) async* {
          yield FailureSuppliersOnMapState();
        },
        (customers) async* {
          yield SuccessLoadingCustomersSuppliersOnMapState(
            customers: customers,
          );
        },
      );
    } else if (event is FindAllNearSuppliersEvent) {
      yield LoadingSuppliersOnMapState();

      final suppliersEither = await getAllSuppliers.call(NoParams());

      yield* suppliersEither.fold(
        (failure) async* {
          yield FailureSuppliersOnMapState();
        },
        (suppliers) async* {
          final filteredSuppliers =
              suppliers.where((supplier) => supplier != null).toList();

          final nearSuppliers = filteredSuppliers.where(
            (sup) =>
                Geolocator.distanceBetween(
                      event.customer.address.lat,
                      event.customer.address.long,
                      sup.address.lat,
                      sup.address.long,
                    ) /
                    1000 <=
                sup.range,
          );

          final suppliersMarkers = nearSuppliers
              .map(
                (sup) => Marker(
                  markerId: MarkerId(sup.id.toString()),
                  position: LatLng(sup.address.lat, sup.address.long),
                  infoWindow: InfoWindow(title: sup.name),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueViolet,
                  ),
                ),
              )
              .toSet();

          //adding customer marker
          suppliersMarkers.add(
            Marker(
              markerId: MarkerId(
                event.customer.id.toString(),
              ),
              position: LatLng(
                event.customer.address.lat,
                event.customer.address.long,
              ),
              infoWindow: InfoWindow(title: event.customer.name),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue,
              ),
            ),
          );

          yield SuccessSuppliersOnMapState(
            customer: event.customer,
            suppliers: filteredSuppliers,
            markers: suppliersMarkers,
          );
        },
      );
    } else if (event is ResetAppEvent) {
      yield LoadingSuppliersOnMapState();
      yield InitialSuppliersOnMapState();
    }
  }
}
