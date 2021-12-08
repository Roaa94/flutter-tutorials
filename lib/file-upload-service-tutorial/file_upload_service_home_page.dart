import 'package:flutter/material.dart';

class FileUploadServiceHomePage extends StatelessWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload Service'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,

        ),
      ),
    );
  }
}
