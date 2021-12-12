import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/media/media_service_interface.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/widgets/avatar_container.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/widgets/image_picker_action_sheet.dart';

class AvatarUploader extends StatefulWidget {
  @override
  _AvatarUploaderState createState() => _AvatarUploaderState();
}

class _AvatarUploaderState extends State<AvatarUploader> {
  final MediaServiceInterface _mediaService = getIt<MediaServiceInterface>();

  File? imageFile;
  bool _isLoadingGettingImage = false;

  Future<AppImageSource?> _pickImageSource() async {
    AppImageSource? _appImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(),
    );
    if (_appImageSource != null) {
      _getImage(_appImageSource);
    }
  }

  Future _getImage(AppImageSource _appImageSource) async {
    setState(() => _isLoadingGettingImage = true);
    final _pickedImageFile = await _mediaService.uploadImage(context, _appImageSource);
    setState(() => _isLoadingGettingImage = false);

    if (_pickedImageFile != null) {
      setState(() => imageFile = _pickedImageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AvatarContainer(
      isLoading: _isLoadingGettingImage,
      onTap: _pickImageSource,
      imageFile: imageFile,
    );
  }
}
