import 'package:flutter_tutorials/avatar-uploader-tutorial/ui/file_upload_service_home_page.dart';
import 'package:flutter_tutorials/refresh-indicator-thread/refresh_indicator_thread_home.dart';

import 'models/tutorial.dart';

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
    ),
  ];
}
