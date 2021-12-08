import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/file/file_uploader_service.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/ui/widgets/image_picker_action_sheet.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadServiceHomePage extends StatefulWidget {
  static const String routeName = 'file-upload-service-home-page';

  @override
  State<FileUploadServiceHomePage> createState() => _FileUploadServiceHomePageState();
}

class _FileUploadServiceHomePageState extends State<FileUploadServiceHomePage> {
  final FileUploaderService _fileUploaderService = getIt<FileUploaderService>();

  File? imageFile;
  bool _isLoadingGettingImage = false;

  void _initGetImage() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(
        fromCamera: () => _getImage(ImageSource.camera),
        fromGallery: () => _getImage(ImageSource.gallery),
        fileImage: imageFile,
      ),
    );
  }

  Future _getImage(ImageSource source) async {
    Navigator.of(context).pop();
    setState(() => _isLoadingGettingImage = true);
    final pickedImageFile = await _fileUploaderService.uploadImage(context, source: source);
    setState(() => _isLoadingGettingImage = false);

    if (pickedImageFile != null) {
      setState(() {
        imageFile = pickedImageFile;
      });
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
          onTap: _isLoadingGettingImage ? null : _initGetImage,
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
