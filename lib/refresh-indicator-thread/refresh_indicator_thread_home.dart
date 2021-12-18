import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorThreadHome extends StatefulWidget {
  static const String routeName = 'refresh-indicator-thread-home';

  @override
  _RefreshIndicatorThreadHomeState createState() => _RefreshIndicatorThreadHomeState();
}

class _RefreshIndicatorThreadHomeState extends State<RefreshIndicatorThreadHome> {
  late Future<List<dynamic>> getToDos;

  Future<List<dynamic>> _getToDos() async {
    const endpoint = 'https://jsonplaceholder.typicode.com/todos?userId=1';
    print('Fetching from: $endpoint');
    var response = await Dio().get(endpoint);
    return response.data;
  }

  @override
  void initState() {
    getToDos = _getToDos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuilt page!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator Example'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getToDos,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An Error Occurred'));
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return RefreshIndicator(
                  onRefresh: () async => setState(() {}),
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
                                Expanded(child: Text(snapshot.data![i]['title'])),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              case ConnectionState.none:
              default:
                return const Center(child: Text('Nothing!'));
            }
          }
        },
      ),
    );
  }
}
