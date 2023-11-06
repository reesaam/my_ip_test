import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../resources/app_urls.dart';
import '../resources/app_texts.dart';

@module
abstract class DioCore {

  @singleton
  Dio get dio => _getDio();

  _getDio() {
    var dio = Dio(BaseOptions(baseUrl: AppURLs.baseUrl));
    dio.options.headers.addAll( {
      AppTexts.dioHeaderContentType: AppTexts.dioHeaderContentTypeData,
      AppTexts.dioHeaderConnection: AppTexts.dioHeaderConnectionData,
    });
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.sendTimeout = const Duration(seconds: 15);
    return dio;
  }
}
