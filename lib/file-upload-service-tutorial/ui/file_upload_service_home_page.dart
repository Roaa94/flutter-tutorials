import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_uploader_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/ui/widgets/avatar_uploader.dart';

class FileUploadServiceHomePage extends StatelessWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('File Upload Service'),
      ),
      body: Center(
        child: AvatarUploader(),
      ),
    );
  }
}
