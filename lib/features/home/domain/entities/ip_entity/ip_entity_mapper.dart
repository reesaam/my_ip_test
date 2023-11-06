import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';

import '../../../data/remote/models/ip_model/ip_model.dart';
import 'ip_entity.dart';

extension OnIpModel on IpModel {
  IpEntity get mapper => IpEntity(ip: ip, country: country, cc: cc);
}

extension OnIpEntity on IpEntity {
  IpModel get mapper => IpModel(ip: ip, country: country, cc: cc);
}

extension IpToLast on IpEntity {
  LastIpEntity get toLastIpEntity =>
      LastIpEntity(ip: ip, country: country, cc: cc, dateTime: DateTime.now());
}
