import 'package:flutter/material.dart';
import 'package:flutter_tutorials/data/app_data.dart';
import 'package:flutter_tutorials/ui/home/widgets/tutorial_list_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorials'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: List.generate(
            AppData.tutorials.length,
            (i) => TutorialListItem(
              title: AppData.tutorials[i].title,
              description: AppData.tutorials[i].description,
            ),
          ),
        ),
      ),
    );
  }
}
