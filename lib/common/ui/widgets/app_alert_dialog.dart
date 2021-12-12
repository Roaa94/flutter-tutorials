import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final Function onConfirm;
  final String title;
  final String subtitle;

  const AppAlertDialog({
    required this.onConfirm,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        ElevatedButton(
          onPressed: () => onConfirm(),
          child: const Text('Confirm'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
