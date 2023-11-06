import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/core/core_components/use_cases/use_case.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';
import 'package:my_ip_test/features/home/domain/repositories/ip_repository.dart';

@injectable
class GetLastIpUseCase implements UseCaseNoParams<Exception, LastIpEntity> {
  final IpRepository repository;

  GetLastIpUseCase({required this.repository});

  @override
  Future<Either<Exception, LastIpEntity>> call() async =>
      await repository.getLastIP();
}
