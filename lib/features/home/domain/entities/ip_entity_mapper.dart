import '../../data/remote/models/ip_model/ip_model.dart';
import 'ip_entity.dart';

extension OnIpModel on IpModel {
  IpEntity get mapper => IpEntity(ip: ip, country: country, cc: cc);
}

extension OnIPEntity on IpEntity {
  IpModel get mapper => IpModel(ip: ip, country: country, cc: cc);
}
