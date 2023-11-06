import 'package:my_ip_test/features/home/data/local/models/last_ip_model/last_ip_model.dart';

extension Converts on LastIpModel {
  String get toPrint => 'IP: $ip\nCountry: $country\nDateTime: $dateTime';
}

extension Checks on LastIpModel {
  bool get isEmpty => this == LastIpModel();
}