import 'package:flutter/material.dart';
import 'package:flutter_tutorials/file-upload-service-tutorial/ui/file_upload_service_home_page.dart';

import 'file-upload-service-tutorial/data/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      routes: <String, WidgetBuilder>{
        FileUploadServiceHomePage.routeName: (context) => FileUploadServiceHomePage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorials'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(FileUploadServiceHomePage.routeName),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
                    bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.2)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'File Uploader Service with GetIt',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              'Upload an avatar using one line is your UI widget and let services take care of everything  in the background; permissions, compression, camera and gallery uploads'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
