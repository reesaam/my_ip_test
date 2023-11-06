import '../../../data/local/models/last_ip_model/last_ip_model.dart';
import 'last_ip_entity.dart';

extension OnLastIpModel on LastIpModel {
  LastIpEntity get mapper =>
      LastIpEntity(ip: ip, country: country, cc: cc, dateTime: dateTime);
}

extension OnLastIPEntity on LastIpEntity {
  LastIpModel get mapper =>
      LastIpModel(ip: ip, country: country, cc: cc, dateTime: dateTime);
}
