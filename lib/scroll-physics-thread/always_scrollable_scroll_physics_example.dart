import 'package:flutter/material.dart';
import 'package:flutter_tutorials/common/ui/widgets/bordered_container.dart';

class AlwaysScrollableScrollPhysicsExample extends StatelessWidget {
  static const String routeName = 'always-scrollable-scroll-physics-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AlwaysScrollableScrollPhysics Example',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                'Adding AlwaysScrollableScrollPhysics to the parent SingleChildScrollView in this page forces scrolling even when the content of the scrollable widget’s content doesn’t exceed the height of the screen',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
              child: Text(
                'Note: It is important that you set shrinkWrap to true in the ListView.builder() widget or else you will get the scary "Vertical viewport was given unbounded height." Error',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (c, i) => BorderedContainer(
                child: Text(
                  'List Item ${i + 1}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
