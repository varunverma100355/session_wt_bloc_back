/*
 * Created by Varun Verma on 12/06/23.
 * File authentication_service.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


import 'package:session_wt_backend/src/local_storage_services/local_storage_manager.dart';
import 'package:session_wt_backend/src/models/user_data.dart';
import 'package:session_wt_backend/src/rest_services/retrofit_client.dart';

import 'package:dio/dio.dart';

class AuthenticationService {
  final String baseUrl;
  final Dio dio;
  AuthenticationService(this.baseUrl, this.dio);

  Future<UserData> getUserData(String email, String password) async {
    final apiCall = await RetrofitClient(dio, baseUrl: baseUrl.toString()).login(email, password);
    return apiCall;
  }

  UserData? get getAuthenticatedUser => LocalStorageManager().getAuthenticatedUser;


}
