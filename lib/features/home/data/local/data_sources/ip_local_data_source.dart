import 'package:dartz/dartz.dart';
import 'package:my_ip_test/features/home/data/local/models/last_ip_model/last_ip_model.dart';

abstract class IpLocalDataSource {
  Future<Either<Exception, LastIpModel>> getLastIp();
  Future<Either<Exception, bool>> saveLastIp(LastIpModel data);
}