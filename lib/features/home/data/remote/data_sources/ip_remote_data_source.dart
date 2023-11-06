import 'package:dartz/dartz.dart';
import 'package:my_ip_test/core/network/network_exception.dart';
import 'package:my_ip_test/features/home/data/remote/models/ip_model/ip_model.dart';

abstract class IpRemoteDataSource {
  Future<Either<NetworkException, IpModel>> getIP();
}