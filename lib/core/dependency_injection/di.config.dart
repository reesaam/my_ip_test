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

import '../../data/storage/local_storage_module.dart' as _i7;
import '../../features/home/data/local/data_sources/ip_local_data_source.dart'
    as _i9;
import '../../features/home/data/local/data_sources/ip_local_data_source_impl.dart'
    as _i10;
import '../../features/home/data/remote/data_sources/ip_remote_data_source.dart'
    as _i5;
import '../../features/home/data/remote/data_sources/ip_remote_data_source_impl.dart'
    as _i6;
import '../../features/home/data/repositories/ip_repository_impl.dart' as _i12;
import '../../features/home/domain/repositories/ip_repository.dart' as _i11;
import '../../features/home/domain/use_cases/get_last_ip_usecase.dart' as _i15;
import '../../features/home/domain/use_cases/ip_usecase.dart' as _i13;
import '../../features/home/domain/use_cases/save_last_ip_usecase.dart' as _i14;
import '../../features/home/presentation/manager/get_last_ip_cubit_state/get_last_ip_cubit.dart'
    as _i17;
import '../../features/home/presentation/manager/ip_cubit_state/ip_cubit.dart'
    as _i16;
import '../app_router/app_router.dart' as _i3;
import '../network/dio.dart' as _i18;
import '../network/network_exception.dart' as _i8;

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
    gh.factory<_i5.IpRemoteDataSource>(
        () => _i6.IpRemoteDataSourceImpl(gh<_i4.Dio>()));
    gh.factory<_i7.LocalStorageModule>(() => _i7.LocalStorageModule());
    gh.factory<_i8.NetworkException>(
        () => _i8.NetworkException(message: gh<String>()));
    gh.lazySingleton<_i9.IpLocalDataSource>(
        () => _i10.IpLocalDataSourceImpl(gh<_i7.LocalStorageModule>()));
    gh.factory<_i11.IpRepository>(() => _i12.IpRepositoryImpl(
          ipRemoteDataSource: gh<_i5.IpRemoteDataSource>(),
          ipLocalDataSource: gh<_i9.IpLocalDataSource>(),
        ));
    gh.factory<_i13.IpUseCase>(
        () => _i13.IpUseCase(repository: gh<_i11.IpRepository>()));
    gh.factory<_i14.SaveLastIpUseCase>(
        () => _i14.SaveLastIpUseCase(repository: gh<_i11.IpRepository>()));
    gh.factory<_i15.GetLastIpUseCase>(
        () => _i15.GetLastIpUseCase(repository: gh<_i11.IpRepository>()));
    gh.factory<_i16.IpCubit>(() => _i16.IpCubit(
          gh<_i13.IpUseCase>(),
          gh<_i14.SaveLastIpUseCase>(),
        ));
    gh.factory<_i17.GetLastIpCubit>(
        () => _i17.GetLastIpCubit(gh<_i15.GetLastIpUseCase>()));
    return this;
  }
}

class _$DioCore extends _i18.DioCore {}
