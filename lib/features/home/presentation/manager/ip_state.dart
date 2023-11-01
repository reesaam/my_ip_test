import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/ip_entity.dart';

part 'ip_state.freezed.dart';

@freezed
class IpState with _$IpState {
  const factory IpState.initial() = _Initial;
  const factory IpState.success({IpEntity? ipEntity}) = _Success;
  const factory IpState.error(String msg) = _Error;
  const factory IpState.loading() = _Loding;
}
