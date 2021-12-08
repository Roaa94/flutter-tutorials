import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagePickerActionSheet extends StatelessWidget {
  final Function? fromCamera;
  final Function? fromGallery;
  final File? fileImage;
  final String? urlImage;
  final bool forcePop;

  const ImagePickerActionSheet({
    this.fromCamera,
    this.fromGallery,
    this.fileImage,
    this.urlImage,
    this.forcePop = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Take Photo'),
          onPressed: () {
            fromCamera!();
            if (forcePop) Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Upload From Gallery'),
          onPressed: () {
            fromGallery!();
            if (forcePop) Navigator.of(context).pop();
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
