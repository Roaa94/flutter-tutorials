import 'dart:io';

import 'package:flutter/material.dart';

class AvatarContainer extends StatelessWidget {
  final Function onTap;
  final File? imageFile;
  final bool isLoading;

  const AvatarContainer({
    required this.onTap,
    required this.imageFile,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : () => onTap(),
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
              if (isLoading) const CircularProgressIndicator(),
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
