import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ip_test/core/app_constants.dart';
import 'package:my_ip_test/core/core_functions.dart';
import 'package:my_ip_test/features/home/data/local/models/last_ip_model/last_ip_model.dart';
import 'package:my_ip_test/features/home/data/remote/models/ip_model/ip_model.dart';

@injectable
class LocalStorageModule {
  Future<Box<dynamic>> get box =>
      Hive.openBox(AppConstants.localStorageModuleName);
}

initLocalStorage() async {
  await Hive.initFlutter();
  appDebugPrint('Local Storage Initialized');
  initHiveTypes();
  await Future.delayed(Duration.zero);
}

initHiveTypes() {
  Hive.registerAdapter(IpModelAdapter());
  Hive.registerAdapter(LastIpModelAdapter());
  appDebugPrint('Hive Adapter Types Initialized');
}