/*
 * Created by Varun Verma on 12/06/23.
 * File contact_service.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/

import 'package:retrofit/http.dart';
import 'package:session_wt_backend/src/local_storage_services/local_storage_manager.dart';
import 'package:session_wt_backend/src/models/contact.dart';
import 'package:session_wt_backend/src/models/model_response.dart';
import 'package:session_wt_backend/src/rest_services/retrofit_client.dart';

import 'package:dio/dio.dart';

class ContactService {
  final String baseUrl;
  final Dio dio;
  ContactService(this.baseUrl, this.dio);


  Stream<List<Contact>> getContact() async* {
    final contacts = LocalStorageManager().getContacts();
    yield contacts;

    final apiCall = await RetrofitClient(dio, baseUrl: baseUrl.toString()).getContacts();
    yield apiCall;
  }
}