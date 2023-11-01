import 'package:dartz/dartz.dart';

import '../../../../core/network/network_exception.dart';
import '../entities/ip_entity.dart';

abstract class IPRepository {
  Future<Either<NetworkException, IpEntity>> getIP();
}