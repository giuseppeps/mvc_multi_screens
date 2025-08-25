import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvc_multi_screens/src/app.dart';
import 'package:mvc_multi_screens/src/core/di/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  setupGetIt();
  runApp(const MyApp());
}
