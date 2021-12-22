import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushMaterialPageRoute(BuildContext context, Widget page, {bool rootNavigator = true}) {
  Navigator.of(context, rootNavigator: rootNavigator).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

Future<void> pushCupertinoPage(
  BuildContext context,
  Widget page, {
  bool rootNavigator = true,
  bool fullscreenDialog = false,
  ValueChanged<dynamic>? onPop,
}) async {
  final response = await Navigator.of(context, rootNavigator: rootNavigator).push(
    CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => page,
      fullscreenDialog: fullscreenDialog,
    ),
  );
  if (onPop != null) {
    onPop(response);
  }
}

void pushAndReplaceCupertinoPage(BuildContext context, Widget page, {bool rootNavigator = false}) {
  Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
    CupertinoPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
  );
}

void pushAndRemoveUntilCupertinoPage(BuildContext context, Widget page, {bool rootNavigator = true}) {
  Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
    CupertinoPageRoute<void>(
      builder: (BuildContext context) => page,
    ),
    (Route<dynamic> route) => false,
  );
}

void pushAndRemoveUntilMaterialPage(BuildContext context, Widget page, {bool rootNavigator = true}) {
  Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
    MaterialPageRoute(builder: (BuildContext context) => page),
    (Route<dynamic> route) => false,
  );
}

void pushFadeInPage(
  BuildContext context,
  Widget page, {
  bool rootNavigator = true,
  Function? onPop,
}) {
  Navigator.of(context, rootNavigator: rootNavigator)
      .push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return Align(
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    ),
  )
      .then((_) {
    if (onPop != null) {
      onPop();
    }
  });
}
