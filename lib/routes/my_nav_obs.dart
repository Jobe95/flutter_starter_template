import 'dart:developer';

import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      'Pushed Route: ${route.settings.name}\nwith arguments:${route.settings.arguments}\nprevious route: ${previousRoute?.settings.name}',
      time: DateTime.now(),
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      'Did pop: ${previousRoute?.settings.name} and active route is: ${route.settings.name}',
      time: DateTime.now(),
    );
  }
}
