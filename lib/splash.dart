import 'package:flutter/material.dart';
import 'package:mysplashscreen/mysplashscreen.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'package:your_splash/your_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen.timed(
        seconds: 5,
        route: MaterialPageRoute(builder: (_) => Home()),
        body: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120.w,
                height: 125.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/image.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'StickMe',
                    style: TextStyle(
                        color: Color(0xFF0C5A42),
                        fontSize: 25.sp,
                        fontFamily: 'SF UI Display'),
                  ),
                  Text(
                    ' Notes',
                    style: TextStyle(
                        color: Color(0xFFFA8704),
                        fontSize: 25.sp,
                        fontFamily: 'SF UI Display'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
