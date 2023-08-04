/*
 * Created by Varun Verma on 12/06/23.
 * File session_wt_backend_base.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


import 'package:hive_flutter/adapters.dart';
import 'package:session_wt_backend/src/rest_services/authentication_service.dart';
import 'package:session_wt_backend/src/rest_services/contact_service.dart';
import 'package:session_wt_backend/src/rest_services/rest_utils.dart';
import 'package:dio/dio.dart';

import 'local_storage_services/local_storage_manager.dart';

class SessionWtBackendBase {

  final ContactService contactService = ContactService(baseUrl, Dio());
  final AuthenticationService authenticationService = AuthenticationService(baseUrl, Dio());

  void initialize() async {
    await Hive.initFlutter();
    await LocalStorageManager().init().then((_) => LocalStorageManager().openBoxes());
  }

}