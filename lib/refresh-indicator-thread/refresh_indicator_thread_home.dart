import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorThreadHome extends StatefulWidget {
  static const String routeName = 'refresh-indicator-thread-home';

  @override
  _RefreshIndicatorThreadHomeState createState() => _RefreshIndicatorThreadHomeState();
}

class _RefreshIndicatorThreadHomeState extends State<RefreshIndicatorThreadHome> {
  late List<dynamic> todos;
  bool _isLoadingTodos = false;

  Future<void> _getToDos() async {
    setState(() => _isLoadingTodos = true);
    try {
      var response = await Dio().get('https://jsonplaceholder.typicode.com/todos?userId=1');
      todos = response.data;
      setState(() => _isLoadingTodos = false);
      print(todos.length);
    } catch (e) {
      setState(() => _isLoadingTodos = false);
      print(e);
    }
  }

  @override
  void initState() {
    _getToDos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator Example'),
      ),
      body: _isLoadingTodos
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _getToDos,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                      child: Text(
                        'Dummy Paragraph',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut justo feugiat, sodales mauris eget, tristique metus. Aliquam mi tortor, fermentum nec viverra et, semper eget risus. Phasellus tincidunt suscipit erat a ullamcorper. In a mattis lectus. Mauris interdum condimentum ullamcorper. Sed eget porta risus, quis pulvinar lorem. Etiam porttitor aliquam diam, tristique mollis nisi ullamcorper eget.'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                      child: Text(
                        'Checklist',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    ...List.generate(
                      3,
                      (i) => Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.check),
                            const SizedBox(width: 5),
                            Expanded(child: Text(todos[i]['title'])),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}