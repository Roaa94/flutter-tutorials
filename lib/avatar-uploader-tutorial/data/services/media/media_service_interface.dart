import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_service.dart';

// Created our own enum to prevent an abstract interface
// from having a dependency on an external package
enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaServiceInterface {
  PermissionService get permissionService;

  Future<File?> uploadImage(
    BuildContext context,
    AppImageSource imageSource, {
    bool shouldCompress = true,
  });

  Future<File?> compressFile(File file, {int quality = 30});
}
