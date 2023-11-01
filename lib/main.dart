import 'package:flutter/material.dart';
import 'package:my_ip_test/core/dependency_injection/di.config.dart';
import 'core/app_info.dart';
import 'core/app_router/app_router.dart';
import 'core/dependency_injection/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  diCore.init;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter().config(),
        title: AppInfo.appName,
      );
}
