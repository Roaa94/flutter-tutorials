import 'package:flutter/material.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/permission/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService implements PermissionService {
  @override
  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  @override
  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  @override
  Future<bool> handleCameraPermission(BuildContext context) async {
    PermissionStatus cameraPermissionStatus = await requestCameraPermission();

    if (cameraPermissionStatus != PermissionStatus.granted) {
      await showDialog(
        context: context,
        builder: (_context) => AlertDialog(
          title: const Text('Camera Permission'),
          content:
              const Text('Camera permission should Be granted to use this feature, would you like to go to app settings to give camera permission?'),
          actions: [
            ElevatedButton(
              onPressed: () => openAppSettings(),
              child: const Text('Confirm'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Future<bool> handlePhotosPermission(BuildContext context) async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      await showDialog(
        context: context,
        builder: (_context) => AlertDialog(
          title: const Text('Photos Permission'),
          content:
              const Text('Photos permission should Be granted to use this feature, would you like to go to app settings to give photos permission?'),
          actions: [
            ElevatedButton(
              onPressed: () => openAppSettings(),
              child: const Text('Confirm'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
