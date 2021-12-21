import 'package:flutter/material.dart';
import 'package:flutter_tutorials/common/ui/widgets/bordered_container.dart';

class ClampingScrollPhysicsExample extends StatelessWidget {
  static const String routeName = 'clamping-scroll-physics-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ClampingScrollPhysics Example',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
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
