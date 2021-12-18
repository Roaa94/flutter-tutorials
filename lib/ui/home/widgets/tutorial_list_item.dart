import 'package:flutter/material.dart';
import 'package:flutter_tutorials/data/models/tutorial.dart';

class TutorialListItem extends StatelessWidget {
  final Tutorial tutorial;

  const TutorialListItem(this.tutorial);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tutorial.tutorialPageRoute == null ? null : () => Navigator.of(context).pushNamed(tutorial.tutorialPageRoute!),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tutorial.title, style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 10),
                  Text(tutorial.description),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
