import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/features/home/presentation/manager/ip_state.dart';

import '../../domain/use_cases/ip_usecase.dart';

@injectable
class IpCubit extends Cubit<IpState> {
  final IPUseCase _ipUseCase;
  IpCubit(this._ipUseCase) : super(const IpState.initial());

  getIP() async {
    emit(const IpState.loading());
    final result = await _ipUseCase.call();
    result.fold((l) {
      emit(IpState.error(l.message));
    }, (r) {
      emit(IpState.success(ipEntity: r));
  });
  }

}
