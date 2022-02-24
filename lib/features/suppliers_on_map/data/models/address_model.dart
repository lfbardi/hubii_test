import 'package:hubii_test/features/suppliers_on_map/domain/entities/address.dart';
import 'package:meta/meta.dart';

class AddressModel extends Address {
  AddressModel({
    @required String street,
    @required String number,
    @required String neighborhood,
    @required String city,
    @required String state,
    @required String country,
    @required double lat,
    @required double long,
  }) : super(
          street: street,
          number: number,
          neighborhood: neighborhood,
          city: city,
          state: state,
          country: country,
          lat: lat,
          long: long,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'number': number,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'country': country,
      'lat': lat,
      'long': long,
    };
  }
}
