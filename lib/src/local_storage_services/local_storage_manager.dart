/*
 * Created by Varun Verma on 12/06/23.
 * File local_storage_manager.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:session_wt_backend/src/models/models.dart';

import 'hive_utils.dart';

class LocalStorageManager {

  LocalStorageManager.internal();
  static final LocalStorageManager _instance = LocalStorageManager.internal();
  factory LocalStorageManager() => LocalStorageManager.internal();

  Future<void> init() async {
    final Directory appPath = await getApplicationDocumentsDirectory();
    Hive.init(appPath.path);
    Hive.registerAdapter(ContactAdapter());
  }

  Future<void> openBoxes() async {
    Hive.openBox(contactHiveBox);
  }

  List<Contact> getContacts() {
    List<Contact> contacts = [];
    final contactBox = Hive.box(contactHiveBox);
    for (int i = 0; i < contactBox.length; i++) {
      contacts.add(contactBox.getAt(i) as Contact);
    }
    return contacts;
  }


}