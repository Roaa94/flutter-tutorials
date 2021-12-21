import 'package:flutter/material.dart';
import 'package:flutter_tutorials/common/ui/widgets/bordered_container.dart';

class NeverScrollableScrollPhysicsExample extends StatelessWidget {
  static const String routeName = 'never-scrollable-scroll-physics-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NeverScrollableScrollPhysics Example',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      'The list below is a created using a ListView.builder() widget and has its physics set to NeverScrollableScrollPhysics() because otherwise you will not be able to scroll it unless you tab inside it ans scroll, so the whole screen does not scroll as a whole, it scrolls by section, which is not a good user experience',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                    child: Text(
                      'Note: It is important that you set shrinkWrap to true in the ListView.builder() widget or else you will get the scary "Vertical viewport was given unbounded height." Error',
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (c, i) => InkWell(
                onTap: () {},
                child: BorderedContainer(
                  child: Text(
                    'List Item ${i + 1}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
