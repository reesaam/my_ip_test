// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_ip_test/core/app_router/app_router.dart' as _i3;
import 'package:my_ip_test/core/network/dio.dart' as _i12;
import 'package:my_ip_test/core/network/network_exception.dart' as _i11;
import 'package:my_ip_test/features/home/data/remote/data_sources/ip_remote_data_source.dart'
    as _i5;
import 'package:my_ip_test/features/home/data/remote/data_sources/ip_remote_data_source_impl.dart'
    as _i6;
import 'package:my_ip_test/features/home/data/repositories/ip_repository_impl.dart'
    as _i8;
import 'package:my_ip_test/features/home/domain/repositories/ip_repository.dart'
    as _i7;
import 'package:my_ip_test/features/home/domain/use_cases/ip_usecase.dart'
    as _i9;
import 'package:my_ip_test/features/home/presentation/manager/ip_cubit.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioCore = _$DioCore();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.singleton<_i4.Dio>(dioCore.dio);
    gh.factory<_i5.IPRemoteDataSource>(
        () => _i6.IPRemoteDataSourceImpl(gh<_i4.Dio>()));
    gh.factory<_i7.IPRepository>(() =>
        _i8.IPRepositoryImpl(ipRemoteDataSource: gh<_i5.IPRemoteDataSource>()));
    gh.factory<_i9.IPUseCase>(
        () => _i9.IPUseCase(repository: gh<_i7.IPRepository>()));
    gh.factory<_i10.IpCubit>(() => _i10.IpCubit(gh<_i9.IPUseCase>()));
    gh.factory<_i11.NetworkException>(
        () => _i11.NetworkException(message: gh<String>()));
    return this;
  }
}

class _$DioCore extends _i12.DioCore {}
