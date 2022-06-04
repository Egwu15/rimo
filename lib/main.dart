import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/screens/home.dart';
import 'package:flutter_application_1/common/theme.dart';
import 'package:flutter_application_1/map/screens/map.screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const HomePage(),
    );
  }
}
