import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_notes/splash.dart';

void main() {
  // runApp(MaterialApp(
  //   home: Splash(),
  // ));
  runApp(ScreenUtilInit(designSize: Size(375, 812), builder: () => MyApp()));
}
