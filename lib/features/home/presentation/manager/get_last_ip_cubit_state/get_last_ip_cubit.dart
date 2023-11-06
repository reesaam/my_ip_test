import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/features/home/domain/use_cases/get_last_ip_usecase.dart';
import 'package:my_ip_test/features/home/presentation/manager/get_last_ip_cubit_state/get_last_ip_state.dart';

import '../../../../../core/core_functions.dart';

@injectable
class GetLastIpCubit extends Cubit<GetLastIpState> {
  final GetLastIpUseCase _getLastIpUseCase;
  GetLastIpCubit(this._getLastIpUseCase)
      : super(const GetLastIpState.initial());

  getLastIp() async {
    appDebugPrint('--> Last Ip Loading State Triggered');
    emit(const GetLastIpState.loading());
    final result = await _getLastIpUseCase.call();
    result.fold((l) {
      appDebugPrint('--> Last Ip Error State Triggered');
      appDebugPrint('Exception: ${l.toString()}');
      emit(GetLastIpState.error(l.toString()));
    }, (r) {
      appDebugPrint('--> Last Ip Success State Triggered');
      appDebugPrint('Data: ${r.toString()}');
      emit(GetLastIpState.success(lastIpEntity: r));
    });
  }
}
