

import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  final status = await Permission.storage.request();
  if (status.isGranted) {
    log('Storage permission granted');
    return true;
  } else if (status.isDenied) {
    log('Storage permission denied');
    return false;
  } else if (status.isPermanentlyDenied) {
    log('Storage permission permanently denied');
    await openAppSettings(); // Open app settings for permission management
    return false;
  } else {
    return false;
  }
}

