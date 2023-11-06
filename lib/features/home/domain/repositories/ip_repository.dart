import 'package:dartz/dartz.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';

import '../../../../core/network/network_exception.dart';
import '../entities/ip_entity/ip_entity.dart';

abstract class IpRepository {
  Future<Either<NetworkException, IpEntity>> getIP();
  Future<Either<Exception, LastIpEntity>> getLastIP();
  Future<Either<Exception, bool>> saveLastIP(LastIpEntity lastIpEntity);
}