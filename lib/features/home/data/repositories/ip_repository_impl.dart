import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ip_test/features/home/domain/entities/ip_entity/ip_entity_mapper.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_mapper.dart';

import '../../../../core/network/network_exception.dart';
import '../../domain/entities/ip_entity/ip_entity.dart';
import '../../domain/repositories/ip_repository.dart';
import '../local/data_sources/ip_local_data_source.dart';
import '../remote/data_sources/ip_remote_data_source.dart';

@Injectable(as: IpRepository)
class IpRepositoryImpl implements IpRepository {
  final IpRemoteDataSource ipRemoteDataSource;
  final IpLocalDataSource ipLocalDataSource;

  IpRepositoryImpl(
      {required this.ipRemoteDataSource, required this.ipLocalDataSource});

  @override
  Future<Either<NetworkException, IpEntity>> getIP() async =>
      await ipRemoteDataSource
          .getIP()
          .then((value) => value.map((r) => r.mapper));

  @override
  Future<Either<Exception, LastIpEntity>> getLastIP() async =>
      await ipLocalDataSource
          .getLastIp()
          .then((value) => value.map((r) => r.mapper));

  @override
  Future<Either<Exception, bool>> saveLastIP(LastIpEntity lastIpEntity) async =>
      await ipLocalDataSource.saveLastIp(lastIpEntity.mapper);
}
