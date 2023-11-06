import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core_components/use_cases/use_case.dart';
import '../../../../core/network/network_exception.dart';
import '../entities/ip_entity/ip_entity.dart';
import '../repositories/ip_repository.dart';

@injectable
class IpUseCase implements UseCaseNoParams<NetworkException, IpEntity> {
  final IpRepository repository;

  IpUseCase({required this.repository});

  @override
  Future<Either<NetworkException, IpEntity>> call() async =>
      await repository.getIP();
}