import 'package:flutter/material.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/file_upload_service_home_page.dart';
import 'package:flutter_tutorials/ui/home/pages/home_page.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
