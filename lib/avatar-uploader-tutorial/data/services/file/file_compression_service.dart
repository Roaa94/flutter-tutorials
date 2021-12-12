import 'dart:io';
import 'dart:math';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/utils.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class FileCompressionService {
  Future<File?> compressImageAndGetFile(File file, String targetPath) async {
    try {
      File? result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: 30,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  static Random random = Random();

  Future<File?> compressImage(
    File imageFile, {
    required String tempKey,
  }) async {
    print('🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄');
    print('Compressing image: ${imageFile.path}, original size: ${getMBFileSize(imageFile)}');
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath = dir.absolute.path + '/${random.nextInt(1000)}-temp.jpg';

    File? _compressedImage = await compressImageAndGetFile(imageFile, targetPath);

    if (_compressedImage != null) {
      double _compressedImageSize = getMBFileSize(_compressedImage);
      print('Compressed Image Size: $_compressedImageSize');
      print('🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄 🌄');
      return _compressedImage;
    }
  }
}
