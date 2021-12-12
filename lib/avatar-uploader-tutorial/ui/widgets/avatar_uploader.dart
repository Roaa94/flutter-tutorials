import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/media/media_service_interface.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/service_locator.dart';

import 'image_picker_action_sheet.dart';

class AvatarUploader extends StatefulWidget {
  @override
  _AvatarUploaderState createState() => _AvatarUploaderState();
}

class _AvatarUploaderState extends State<AvatarUploader> {
  final MediaServiceInterface _mediaService = getIt<MediaServiceInterface>();

  File? imageFile;
  bool _isLoadingGettingImage = false;

  Future<AppImageSource?> _pickImageSource() async {
    AppImageSource? pickedImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(),
    );
    if (pickedImageSource != null) {
      _getImage(pickedImageSource);
    }
  }

  Future _getImage(AppImageSource _imageSource) async {
    setState(() => _isLoadingGettingImage = true);
    final pickedImageFile = await _mediaService.uploadImage(context, _imageSource);
    setState(() => _isLoadingGettingImage = false);

    if (pickedImageFile != null) {
      setState(() => imageFile = pickedImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoadingGettingImage ? null : _pickImageSource,
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
    );
  }
}
