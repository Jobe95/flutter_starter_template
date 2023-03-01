import 'package:flutter/material.dart';
import 'service_locator.dart' as di;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}
