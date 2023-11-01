import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final diCore = GetIt.instance;

@InjectableInit(initializerName: 'init')
class InjectionCore {
  static T getInstance<T extends Object>() {
    return diCore.get<T>();
  }
}