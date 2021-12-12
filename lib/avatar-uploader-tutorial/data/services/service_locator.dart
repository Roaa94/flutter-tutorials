import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/file/file_compression_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/file/file_uploader_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_handler_permission_service.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/permission/permission_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  //Permission service is used in FileCompressionService & FileUploaderService
  // so it must be located first
  getIt.registerSingleton<PermissionService>(PermissionHandlerPermissionService());

  getIt.registerSingleton<FileCompressionService>(FileCompressionService());

  getIt.registerSingleton<FileUploaderService>(FileUploaderService());
}