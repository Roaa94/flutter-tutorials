import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_compression_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/permission/permission_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/utils.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/ui/widgets/image_picker_action_sheet.dart';
import 'package:image_picker/image_picker.dart';

class FileUploaderService {
  final FileCompressionService _fileCompressionService = getIt<FileCompressionService>();
  final PermissionService _permissionService = getIt<PermissionService>();

  Future<ImageSource?> _pickImageSource(BuildContext context) async {
    ImageSource? pickedImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(),
    );
    if (pickedImageSource == null) {
      return null;
    }
    return pickedImageSource;
  }

  Future<bool> _handleImageUploadPermissions(BuildContext context, ImageSource? _imageSource) async {
    if (_imageSource == null) {
      return false;
    } else {
      if (_imageSource == ImageSource.camera) {
        return await _permissionService.handleCameraPermission(context);
      } else {
        return await _permissionService.handlePhotosPermission(context);
      }
    }
  }

  Future<File?> uploadImage(
    BuildContext context, {
    bool shouldCompress = true,
  }) async {
    //Show image source picker (camera/gallery)
    ImageSource? imageSource = await _pickImageSource(context);
    // Handle permissions according to image source,
    // returns false if image source picker was dismissed and null returned
    bool canProceed = await _handleImageUploadPermissions(context, imageSource);

    if (!canProceed) {
      return null;
    }

    File? processedPickedImageFile;

    final imagePicker = ImagePicker();
    final rawPickedImageFile = await imagePicker.pickImage(source: imageSource!, imageQuality: 50);

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
