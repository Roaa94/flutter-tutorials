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
        child: Column(
          children: List.generate(
            AppData.appTutorials.length,
            (i) => TutorialListItem(AppData.appTutorials[i]),
          ),
        ),
      ),
    );
  }
}
