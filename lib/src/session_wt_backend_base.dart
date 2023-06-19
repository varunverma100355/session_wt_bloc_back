/*
 * Created by Varun Verma on 12/06/23.
 * File session_wt_backend_base.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


import 'dart:io';

import 'package:session_wt_backend/src/rest_services/contact_service.dart';
import 'package:session_wt_backend/src/rest_services/rest_utils.dart';
import 'package:dio/dio.dart';

class SessionWtBackendBase{

  final ContactService contactService = ContactService(baseUrl, Dio());

}