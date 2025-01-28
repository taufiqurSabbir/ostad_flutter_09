import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Home.dart';
import 'moduleNineThree.dart';
import 'module_9_class_1.dart';
import 'module_9_class_2.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
              primaryColor: Colors.red,
              appBarTheme: AppBarTheme(
                color: Colors.red,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: Colors.white,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white))),
          title: 'Ostad Flutter app',
          home: Moduleninethree(),
        );
      }
    );
  }
}

