import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          'assets/images/avatar.png',
          fit: BoxFit.cover,
          height: 400,
          width: double.infinity,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
