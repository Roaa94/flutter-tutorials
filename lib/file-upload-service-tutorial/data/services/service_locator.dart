import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_compression_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_uploader_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/permission/permission_handler_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/permission/permission_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  //Permission service is used in FileCompressionService & FileUploaderService
  // so it must be located first
  getIt.registerSingleton<PermissionService>(PermissionHandlerService());

  getIt.registerSingleton<FileCompressionService>(FileCompressionService());

  getIt.registerSingleton<FileUploaderService>(FileUploaderService());
}
