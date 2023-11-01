import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ip_test/features/home/domain/entities/ip_entity_mapper.dart';

import '../../../../core/network/network_exception.dart';
import '../../domain/entities/ip_entity.dart';
import '../../domain/repositories/ip_repository.dart';
import '../remote/data_sources/ip_remote_data_source.dart';

@Injectable(as: IPRepository)
class IPRepositoryImpl implements IPRepository {
  final IPRemoteDataSource ipRemoteDataSource;

  IPRepositoryImpl({required this.ipRemoteDataSource});

  @override
  Future<Either<NetworkException, IpEntity>> getIP() async =>
      await ipRemoteDataSource
          .getIP()
          .then((value) => value.map((r) => r.mapper));
}
