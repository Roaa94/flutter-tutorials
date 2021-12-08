import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_uploader_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/service_locator.dart';

class FileUploadServiceHomePage extends StatefulWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  State<FileUploadServiceHomePage> createState() => _FileUploadServiceHomePageState();
}

class _FileUploadServiceHomePageState extends State<FileUploadServiceHomePage> {
  final FileUploaderService _fileUploaderService = getIt<FileUploaderService>();

  File? imageFile;
  bool _isLoadingGettingImage = false;

  Future _getImage() async {
    setState(() => _isLoadingGettingImage = true);
    final pickedImageFile = await _fileUploaderService.uploadImage(context);
    setState(() => _isLoadingGettingImage = false);

    if (pickedImageFile != null) {
      setState(() => imageFile = pickedImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('File Upload Service'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _isLoadingGettingImage ? null : _getImage,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueGrey.withOpacity(0.5),
              border: Border.all(width: 3, color: Colors.teal),
              image: imageFile == null
                  ? null
                  : DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                    ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 70),
                  if (_isLoadingGettingImage) const CircularProgressIndicator(),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 200,
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Center(
                      child: Text(
                        imageFile == null ? 'Upload Image' : 'Change Image',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
