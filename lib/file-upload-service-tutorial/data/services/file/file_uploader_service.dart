import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_compression_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/permission/permission_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/utils.dart';
import 'package:image_picker/image_picker.dart';

class FileUploaderService {
  final FileCompressionService _fileCompressionService = getIt<FileCompressionService>();
  final PermissionService _permissionService = getIt<PermissionService>();

  Future<File?> uploadImage(
    BuildContext context, {
    required ImageSource source,
    bool shouldCompress = true,
  }) async {
    bool canProceed;
    if (source == ImageSource.camera) {
      canProceed = await _permissionService.handleCameraPermission(context);
    } else {
      canProceed = await _permissionService.handlePhotosPermission(context);
    }
    if (!canProceed) {
      print('😰 😰 😰 😰 😰 😰 Permission to photos OR camera was not granted! 😰 😰 😰 😰 😰 😰');
      return null;
    }

    File? pickedImageFile;

    final imagePicker = ImagePicker();
    final pickedImageXFile = await imagePicker.pickImage(source: source, imageQuality: 50);

    if (pickedImageXFile != null) {
      pickedImageFile = File(pickedImageXFile.path);
      double _pickedImageFileSize = getMBFileSize(pickedImageFile);
      print('Picked image size in MB: $_pickedImageFileSize');
      print('Picked Image File Size: $_pickedImageFileSize');

      if (shouldCompress && _pickedImageFileSize > 1) {
        pickedImageFile = await _fileCompressionService.compressImageUntilTarget(
          pickedImageFile,
          tempKey: pickedImageXFile.name,
        );
      }
    }
    return pickedImageFile;
  }
}
