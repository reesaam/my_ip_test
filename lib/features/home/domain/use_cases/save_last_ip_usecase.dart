import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/core/core_components/use_cases/use_case.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';
import 'package:my_ip_test/features/home/domain/repositories/ip_repository.dart';

@injectable
class SaveLastIpUseCase
    implements UseCaseWithParams<Exception, bool, LastIpEntity> {
  final IpRepository repository;

  SaveLastIpUseCase({required this.repository});

  @override
  Future<Either<Exception, bool>> call(LastIpEntity lastIpEntity) async =>
      await repository.saveLastIP(lastIpEntity);
}
