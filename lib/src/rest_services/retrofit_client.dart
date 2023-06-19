/*
 * Created by Varun Verma on 19/06/23.
 * File retrofit_client.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/

import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:session_wt_backend/src/models/model_response.dart';
import 'package:session_wt_backend/src/rest_services/rest_utils.dart';

import '../models/models.dart';
import '../models/user_data.dart';
import 'custom_logger_interceptor.dart';

part 'retrofit_client.g.dart';

@RestApi()
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String? baseUrl}) {
    const Duration duration = Duration(seconds: 60);
    dio.options = BaseOptions(connectTimeout: duration, receiveTimeout: duration, sendTimeout: duration);

    dio.interceptors.add(CustomLoggerInterceptor(logResponse: true));

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';

    return _RetrofitClient(dio, baseUrl: baseUrl);
  }

  @GET(loginPath)
  Future<UserData> login(@Query('email') final String email, @Query('password') final String password);

  @GET(contactsPath)
  Future<List<Contact>> getContacts();
}
