import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/features/home/domain/entities/ip_entity/ip_entity_mapper.dart';
import 'package:my_ip_test/features/home/presentation/manager/ip_cubit_state/ip_state.dart';

import '../../../../../core/core_functions.dart';
import '../../../domain/use_cases/ip_usecase.dart';
import '../../../domain/use_cases/save_last_ip_usecase.dart';

@injectable
class IpCubit extends Cubit<IpState> {
  final IpUseCase _ipUseCase;
  final SaveLastIpUseCase _saveLastIpUseCase;
  IpCubit(this._ipUseCase, this._saveLastIpUseCase)
      : super(const IpState.initial());

  getIP() async {
    appDebugPrint('--> Ip Loading State Triggered');
    emit(const IpState.loading());
    final result = await _ipUseCase.call();
    result.fold((l) {
      appDebugPrint('--> Ip Error State Triggered');
      appDebugPrint('Exception: ${l.message}');
      emit(IpState.error(l.message));
    }, (r) async {
      appDebugPrint('--> Ip Success State Triggered');
      appDebugPrint('Received IP: ${r.ip}');
      emit(IpState.success(ipEntity: r));
      await _saveLastIpUseCase.call(r.toLastIpEntity);
      appDebugPrint('LastIP Saved');
    });
  }
}
