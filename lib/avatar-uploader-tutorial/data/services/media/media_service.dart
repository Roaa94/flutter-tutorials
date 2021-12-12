import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/media/media_service_interface.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class MediaService implements MediaServiceInterface {
  @override
  PermissionService get permissionService => getIt<PermissionService>();

  Future<bool> _handleImageUploadPermissions(BuildContext context, ImageSource? _imageSource) async {
    if (_imageSource == null) {
      return false;
    }
    if (_imageSource == ImageSource.camera) {
      return await permissionService.handleCameraPermission(context);
    } else {
      return await permissionService.handlePhotosPermission(context);
    }
  }

  @override
  Future<File?> uploadImage(
    BuildContext context,
    AppImageSource imageSource, {
    bool shouldCompress = true,
  }) async {
    // Convert our own AppImageSource into a format readable by the used package
    // In this case it's an ImageSource enum
    ImageSource? _imageSource = ImageSource.values.byName(imageSource.name);
    // Handle permissions according to image source,
    bool canProceed = await _handleImageUploadPermissions(context, _imageSource);

    if (canProceed) {
      File? processedPickedImageFile;

      final imagePicker = ImagePicker();
      final rawPickedImageFile = await imagePicker.pickImage(source: _imageSource, imageQuality: 50);

      if (rawPickedImageFile != null) {
        //to convert from XFile type provided by the package to dart:io's File type
        processedPickedImageFile = File(rawPickedImageFile.path);
        if (shouldCompress) {
          processedPickedImageFile = await compressFile(processedPickedImageFile);
        }
      }
      return processedPickedImageFile;
    }
  }

  @override
  Future<File?> compressFile(File file, {int quality = 30}) async {
    print('Compressing image: ${file.path}, original size: ${getMBFileSize(file)}');
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + '/${Random().nextInt(1000)}-temp.jpg';

    return await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
  }
}
