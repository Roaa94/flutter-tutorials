import 'package:flutter/material.dart';
import 'package:flutter_tutorials/animated-cross-fade/widgets/avatar_image.dart';
import 'package:flutter_tutorials/animated-cross-fade/widgets/cover_image.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  static const routeName = 'animated-cross-fade-example';

  @override
  State<AnimatedCrossFadeExample> createState() => _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  final ValueNotifier<bool> avatarIsSelectedNotifier = ValueNotifier<bool>(true);

  final List<String> buttons = [
    'Profile Picture',
    'Cover',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              children: List.generate(
                buttons.length,
                (index) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => avatarIsSelectedNotifier.value = index == 0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(buttons[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: avatarIsSelectedNotifier,
              builder: (c, bool avatarIsSelected, _) => AnimatedCrossFade(
                firstChild: AvatarImage(),
                secondChild: CoverImage(),
                sizeCurve: Curves.easeInOut,
                crossFadeState: avatarIsSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400),
              ),
            ),
            const SizedBox(height: 20),
            Text('Bio', style: TextStyle(color: Colors.grey.withOpacity(0.7))),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                10,
                (index) => Container(
                  height: 15,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
