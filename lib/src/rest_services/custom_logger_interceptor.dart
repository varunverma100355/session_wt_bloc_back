/*
 * Created by Varun Verma on 19/06/23.
 * File custom_logger_interceptor.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class CustomLoggerInterceptor extends Interceptor {

  final bool logResponse;
  final bool logHeaders;

  static const String logTag = "SITEMAP";
  static const String logErrorTag = "SITEMAP_ERROR";

  /// LEVEL ALL 0
  //  LEVEL FINEST 300
  //  LEVEL FINER 400
  //  LEVEL FINE 500
  //  LEVEL CONFIG 700
  //  LEVEL INFO 800
  //  LEVEL WARNING 900
  //  LEVEL SEVERE 1000
  //  LEVEL SHOUT 1200

  int requestTime = 0;

  CustomLoggerInterceptor({this.logResponse = false, this.logHeaders = false});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    requestTime = DateTime.now().millisecondsSinceEpoch;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final currentDateTime = DateTime.now();
    final String message = """[${currentDateTime.toLocal().toIso8601String()}]\n
    ${response.requestOptions.method}: ${response.requestOptions.baseUrl}${response.requestOptions.path}
    Headers[JSON]: ${logHeaders ? json.encode(response.requestOptions.headers) : 'Disabled'}
    Query Params[JSON]: ${json.encode(response.requestOptions.queryParameters)}
    Body[JSON]: ${json.encode(response.requestOptions.data)}
    Extra[JSON]: ${json.encode(response.requestOptions.extra)}
    Response[${response.statusCode}]: ${logResponse ? json.encode(response.data) : 'Disabled'}
    Elapsed Time[MS]: ${currentDateTime.millisecondsSinceEpoch - requestTime}
    End ${response.requestOptions.method}
    """;

    log(
      message,
      name: logTag,
      level: 800,
      time: currentDateTime,
    );

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final currentDateTime = DateTime.now();
    final String message = """[${currentDateTime.toLocal().toIso8601String()}]\n
    ${err.requestOptions.method}: ${err.requestOptions.baseUrl}${err.requestOptions.path}
    Headers: ${json.encode(err.requestOptions.headers)}
    Query Params: ${json.encode(err.requestOptions.queryParameters)}
    Body: ${json.encode(err.requestOptions.data)}
    Response: ${err.response?.data != null ? json.encode(err.response!.data) : '{}'}
    Elapsed Time: ${currentDateTime.millisecondsSinceEpoch - requestTime} MS
    End ${err.requestOptions.method}
    """;

    log(
      message,
      name: logErrorTag,
      level: 900,
      time: currentDateTime,
    );

    handler.next(err);
  }
}