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

  Future<bool> _handleImageUploadPermissions(BuildContext context, ImageSource _imageSource) async {
    if (_imageSource == ImageSource.camera) {
      return await _permissionService.handleCameraPermission(context);
    } else {
      return await _permissionService.handlePhotosPermission(context);
    }
  }

  Future<File?> uploadImage(
    BuildContext context,
    ImageSource imageSource, {
    bool shouldCompress = true,
  }) async {
    // Handle permissions according to image source,
    bool canProceed = await _handleImageUploadPermissions(context, imageSource);

    if (canProceed) {
      File? processedPickedImageFile;

      final imagePicker = ImagePicker();
      final rawPickedImageFile = await imagePicker.pickImage(source: imageSource, imageQuality: 50);

      if (rawPickedImageFile != null) {
        processedPickedImageFile = File(rawPickedImageFile.path);
        double _pickedImageFileSize = getMBFileSize(processedPickedImageFile);
        print('Picked image size in MB: $_pickedImageFileSize');

        if (shouldCompress && _pickedImageFileSize > 1) {
          processedPickedImageFile = await _fileCompressionService.compressImage(
            processedPickedImageFile,
            tempKey: rawPickedImageFile.name,
          );
        }
      }
      return processedPickedImageFile;
    }
  }
}
