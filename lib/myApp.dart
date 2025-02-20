import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/waterTracker.dart';
import 'package:sizer/sizer.dart';

import 'Home.dart';
import 'calculatorApp.dart';
import 'module-13/module_13_class_1.dart';
import 'moduleNineThree.dart';
import 'module_11_class_1.dart';
import 'module_12_class_1.dart';
import 'module_12_class_2.dart';
import 'module_12_class_3.dart';
import 'module_9_class_1.dart';
import 'module_9_class_2.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            brightness: Brightness.light,
              primaryColor: Colors.orange,
              appBarTheme: AppBarTheme(
                color: Colors.orange,
                centerTitle: true,
              ),

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white))),
          title: 'Ostad Flutter app',
          home: Module13Class1(),
        );
      }
    );
  }
}

