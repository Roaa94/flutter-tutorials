import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;

  const BorderedContainer({
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
        color: color,
      ),
      child: child,
    );
  }
}
