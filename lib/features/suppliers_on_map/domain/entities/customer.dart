import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'address.dart';

class Customer extends Equatable {
  final int id;
  final Address address;
  final String name;

  Customer({
    @required this.id,
    @required this.address,
    @required this.name,
  }) : super([id, address, name]);
}
