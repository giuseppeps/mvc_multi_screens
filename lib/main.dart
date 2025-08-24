import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/app.dart';
import 'package:mvc_multi_screens/src/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const MyApp());
}
