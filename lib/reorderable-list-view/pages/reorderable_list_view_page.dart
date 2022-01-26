import 'package:flutter/material.dart';
import 'package:flutter_tutorials/ui/home/widgets/list_item.dart';

class ReorderableListViewPage extends StatefulWidget {
  static const String routeName = 'reorderable-list-view-page';

  @override
  _ReorderableListViewPageState createState() => _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  final List<String> _list = [
    'List Item 1',
    'List Item 2',
    'List Item 3',
    'List Item 4',
  ];

  void reorderList(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    setState(() {
      final String _item = _list.removeAt(oldIndex);
      _list.insert(newIndex, _item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView Example'),
      ),
      body: ReorderableListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        onReorder: reorderList,
        children: List.generate(
          _list.length,
          (index) => ListItem(_list[index], ValueKey(index)),
        ),
      ),
    );
  }
}
