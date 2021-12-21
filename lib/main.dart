import 'package:flutter/material.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/data/services/service_locator.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/file_upload_service_home_page.dart';
import 'package:flutter_tutorials/refresh-indicator-thread/refresh_indicator_thread_home.dart';
import 'package:flutter_tutorials/scroll-physics-thread/always_scrollable_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/bouncing_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/clamping_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/fixed_extent_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/never_scrollable_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/scroll_physics_thread_home.dart';
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
        RefreshIndicatorThreadHome.routeName: (context) => RefreshIndicatorThreadHome(),
        ScrollPhysicsThreadHome.routeName: (context) => ScrollPhysicsThreadHome(),
        NeverScrollableScrollPhysicsExample.routeName: (context) => NeverScrollableScrollPhysicsExample(),
        BouncingScrollPhysicsExample.routeName: (context) => BouncingScrollPhysicsExample(),
        ClampingScrollPhysicsExample.routeName: (context) => ClampingScrollPhysicsExample(),
        FixedExtentScrollPhysicsExample.routeName: (context) => FixedExtentScrollPhysicsExample(),
        AlwaysScrollableScrollPhysicsExample.routeName: (context) => AlwaysScrollableScrollPhysicsExample(),
      },
      home: HomePage(),
    );
  }
}
