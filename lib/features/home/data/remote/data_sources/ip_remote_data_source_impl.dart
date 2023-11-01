import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/resources/app_urls.dart';
import '../../../../../core/network/network_exception.dart';
import '../models/ip_model/ip_model.dart';
import 'ip_remote_data_source.dart';

@Injectable(as: IPRemoteDataSource)
class IPRemoteDataSourceImpl implements IPRemoteDataSource {
  final Dio dio;

  IPRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<NetworkException, IpModel>> getIP() async {
    try {
      Response response = await dio.get(
        AppURLs.apiBaseUrl,
        onReceiveProgress: (count, total) => debugPrint('$count / $total'),
      );
      if (response.statusCode == 200) {
        return Right(IpModel.fromJson(jsonDecode(response.data)));
      }
      return Left(NetworkException.handleResponse(response));
    } on DioException catch (ex) {
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      return Left(NetworkException.parsingDataException());
    }
  }
}
