import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:my_ip_test/core/core_functions.dart';

import '../../../../../core/resources/app_urls.dart';
import '../../../../../core/network/network_exception.dart';
import '../models/ip_model/ip_model.dart';
import 'ip_remote_data_source.dart';

@Injectable(as: IpRemoteDataSource)
class IpRemoteDataSourceImpl implements IpRemoteDataSource {
  final Dio dio;

  IpRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<NetworkException, IpModel>> getIP() async {
    try {
      appDebugPrint('Getting IP...');
      Response response = await dio.get(
        AppURLs.apiUrl,
        onReceiveProgress: (count, total) => debugPrint('$count / $total'),
      );
      appDebugPrint('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        appDebugPrint('Response Received');
        appDebugPrint('IP: ${IpModel.fromJson(jsonDecode(response.data)).ip}');
        return Right(IpModel.fromJson(jsonDecode(response.data)));
      }
      appDebugPrint('Exception Occurred');
      appDebugPrint('--> Status: ${response.statusMessage}');
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      appDebugPrint('Dio Exception Caught.');
      appDebugPrint('--> ${ex.message}');
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      appDebugPrint('An Exception Caught.');
      appDebugPrint('--> ${ex.toString()}');
      return Left(NetworkException.parsingDataException());
    }
  }
}
