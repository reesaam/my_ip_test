import 'package:flutter/material.dart';
import 'package:my_ip_test/core/core_functions.dart';
import 'package:my_ip_test/core/resources/app_themes.dart';
import 'package:my_ip_test/data/storage/local_storage_module.dart';
import 'core/app_info.dart';
import 'core/app_router/app_router.dart';
import 'core/dependency_injection/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  initDependencyInjection();
  appDebugPrint('Dependency Injection Initialization Completed.');
  await diCore.allReady();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().config(),
        title: AppInfo.appName,
        theme: AppThemes.main,
      );
}
