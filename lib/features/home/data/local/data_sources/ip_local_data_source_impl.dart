import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/core/core_functions.dart';
import 'package:my_ip_test/core/dependency_injection/di.dart';
import 'package:my_ip_test/core/extensions/extension_last_ip_model.dart';
import 'package:my_ip_test/core/resources/app_enums.dart';
import 'package:my_ip_test/core/resources/app_texts.dart';
import 'package:my_ip_test/data/storage/local_storage_module.dart';
import 'package:my_ip_test/features/home/data/local/data_sources/ip_local_data_source.dart';
import 'package:my_ip_test/features/home/data/local/models/last_ip_model/last_ip_model.dart';

@LazySingleton(as: IpLocalDataSource)
class IpLocalDataSourceImpl extends IpLocalDataSource {
  final LocalStorageModule localModule;

  IpLocalDataSourceImpl(this.localModule);

  @override
  Future<Either<Exception, LastIpModel>> getLastIp() async {
    try {
      Box box = await diCore<LocalStorageModule>().box;
      LastIpModel data = LastIpModel();
      box.length == 0
          ? null
          : data = box.get(LocalStorageKeys.lastIp.name,
              defaultValue: AppTexts.emptyString);
      data.isEmpty ? appDebugPrint(AppTexts.emptyData) : appDebugPrint(data.toPrint);
      return box.isEmpty || data.isEmpty
          ? Left(Exception(AppTexts.emptyData))
          : Right(data);
    } on Exception catch (ex) {
      appDebugPrint('Exception Caught: ${ex.toString()}');
      return Left(Exception(ex));
    }
  }

  @override
  Future<Either<Exception, bool>> saveLastIp(LastIpModel data) async {
    try {
      Box box = await diCore<LocalStorageModule>().box;
      box.put(LocalStorageKeys.lastIp.name, data);
      appDebugPrint('Last IP Saved');
      appDebugPrint('Current Box Keys: ${box.keys}');
      return const Right(true);
    } on Exception catch (ex) {
      appDebugPrint('Exception Caught: ${ex.toString()}');
      return Left(Exception(ex));
    }
  }
}
