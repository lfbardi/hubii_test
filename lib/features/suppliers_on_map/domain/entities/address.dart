import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Address extends Equatable {
  final String street;
  final String number;
  final String neighborhood;
  final String city;
  final String state;
  final String country;
  final double lat;
  final double long;

  Address({
    @required this.street,
    @required this.number,
    @required this.neighborhood,
    @required this.city,
    @required this.state,
    @required this.country,
    @required this.lat,
    @required this.long,
  }) : super([street, number, neighborhood, city, state, country, lat, long]);
}
