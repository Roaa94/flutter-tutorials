import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        'https://cdn.pixabay.com/photo/2016/03/26/13/09/workspace-1280538_1280.jpg',
        fit: BoxFit.cover,
        height: 200,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
