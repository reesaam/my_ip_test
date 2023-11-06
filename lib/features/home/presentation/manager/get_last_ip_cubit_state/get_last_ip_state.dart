import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_ip_test/features/home/domain/entities/last_ip_entity/last_ip_entity.dart';

part 'get_last_ip_state.freezed.dart';

@freezed
class GetLastIpState with _$GetLastIpState {
  const factory GetLastIpState.initial() = _Initial;
  const factory GetLastIpState.success({LastIpEntity? lastIpEntity}) = _Success;
  const factory GetLastIpState.error(String msg) = _Error;
  const factory GetLastIpState.loading() = _Loading;
}