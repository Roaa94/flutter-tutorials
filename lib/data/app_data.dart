import 'package:flutter_tutorials/animated-cross-fade/pages/animated_cross_fade_example.dart';
import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/file_upload_service_home_page.dart';
import 'package:flutter_tutorials/data/models/scroll_physics_data.dart';
import 'package:flutter_tutorials/data/models/tutorial.dart';
import 'package:flutter_tutorials/refresh-indicator-thread/refresh_indicator_thread_home.dart';
import 'package:flutter_tutorials/reorderable-list-view/pages/reorderable_list_view_page.dart';
import 'package:flutter_tutorials/scroll-physics-thread/always_scrollable_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/bouncing_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/clamping_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/fixed_extent_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/never_scrollable_scroll_physics_example.dart';
import 'package:flutter_tutorials/scroll-physics-thread/scroll_physics_thread_home.dart';

class AppData {
  static List<Tutorial> appTutorials = [
    Tutorial(
      title: 'Image Uploader With App Permissions and Compression Using GetIt Services',
      description:
          'Allow image upload in your Flutter app with one line of code in your widget while handling everything from camera & gallery permissions to image compression under the hood with GetIt and the service locator pattern.',
      tutorialPageRoute: FileUploadServiceHomePage.routeName,
      tutorialLink: 'https://medium.com/@roaa_k/flutter-image-uploader-with-app-permissions-and-compression-using-getit-services-59ffea13f913',
    ),
    Tutorial(
        title: 'ToDo List With RefreshIndicator',
        description: 'Fetch a ToDo list from jsonplaceholder and use RefreshIndicator widget to refetch data',
        tutorialPageRoute: RefreshIndicatorThreadHome.routeName,
        tutorialLink: 'https://twitter.com/roaakdm/status/1472181621759655939'),
    Tutorial(
      title: 'ScrollPhysics Types With Examples',
      description: 'See all types of ScrollPhysics with example usages and code',
      tutorialPageRoute: ScrollPhysicsThreadHome.routeName,
    ),
    Tutorial(
      title: 'ReorderableListView',
      description: 'Easily allow your users to reorder a list using the ReorderableListView widget',
      tutorialPageRoute: ReorderableListViewPage.routeName,
    ),
    Tutorial(
      title: 'AnimatedCrossFade widget',
      description: 'Use the AnimatedCrossFade widget to apply smooth fade animation when switching between two widgets for a better user experience, instead of abruptly ',
      tutorialPageRoute: AnimatedCrossFadeExample.routeName,
    ),
  ];

  static List<ScrollPhysicsData> scrollPhysicsTypes = [
    ScrollPhysicsData(
      title: 'NeverScrollableScrollPhysics',
      pageRoute: NeverScrollableScrollPhysicsExample.routeName,
    ),
    ScrollPhysicsData(
      title: 'AlwaysScrollableScrollPhysics',
      pageRoute: AlwaysScrollableScrollPhysicsExample.routeName,
    ),
    ScrollPhysicsData(
      title: 'BouncingScrollPhysics',
      pageRoute: BouncingScrollPhysicsExample.routeName,
    ),
    ScrollPhysicsData(
      title: 'ClampingScrollPhysics',
      pageRoute: ClampingScrollPhysicsExample.routeName,
    ),
    ScrollPhysicsData(
      title: 'FixedExtentScrollPhysics',
      pageRoute: FixedExtentScrollPhysicsExample.routeName,
    ),
  ];
}
