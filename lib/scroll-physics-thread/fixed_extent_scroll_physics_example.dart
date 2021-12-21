import 'package:flutter/material.dart';
import 'package:flutter_tutorials/common/ui/widgets/bordered_container.dart';

class FixedExtentScrollPhysicsExample extends StatelessWidget {
  static const String routeName = 'fixed-extent-scroll-physics-example';
  final FixedExtentScrollController fixedExtentScrollController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FixedExtentScrollPhysics Example',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
      ),
      body: ListWheelScrollView(
        controller: fixedExtentScrollController,
        physics: const FixedExtentScrollPhysics(),
        itemExtent: MediaQuery.of(context).size.height,
        overAndUnderCenterOpacity: 0,
        children: List.generate(
          20,
          (i) => BorderedContainer(
            color: Colors.teal.withOpacity(0.3),
            child: Center(
              child: Text(
                'List Item ${i + 1}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
