import 'package:flutter/material.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/widgets/avatar_uploader.dart';

class FileUploadServiceHomePage extends StatelessWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Avatar Uploader'),
      ),
      body: Center(
        child: AvatarUploader(),
      ),
    );
  }
}
