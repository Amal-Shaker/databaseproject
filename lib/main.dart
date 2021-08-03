import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_notes/helper/db_helper.dart';
import 'package:sticky_notes/screens/splash.dart';

void main() async {
  // runApp(MaterialApp(
  //   home: Splash(),
  // ));
  WidgetsFlutterBinding.ensureInitialized();

  await DbHelper.dbHelper.intDatabase();

  runApp(ScreenUtilInit(designSize: Size(375, 812), builder: () => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}
