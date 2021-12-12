import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/media/media_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/media/media_service_interface.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_handler_permission_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  // Permission service is used in FileUploaderService
  // so it must be located first
  getIt.registerSingleton<PermissionService>(PermissionHandlerPermissionService());

  getIt.registerSingleton<MediaServiceInterface>(MediaService());
}