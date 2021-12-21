import 'package:flutter/material.dart';
import 'package:flutter_tutorials/common/ui/widgets/bordered_container.dart';

class BouncingScrollPhysicsExample extends StatelessWidget {
  static const String routeName = 'bouncing-scroll-physics-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BouncingScrollPhysics Example',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (c, i) => BorderedContainer(
          child: Text(
            'List Item ${i + 1}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
