import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'address.dart';

class Supplier extends Equatable {
  final int id;
  final Address address;
  final String name;
  final double range;

  Supplier({
    @required this.id,
    @required this.address,
    @required this.name,
    @required this.range,
  }) : super([id, address, name, range]);
}
