import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_notes/home.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 141.w,
              decoration: BoxDecoration(
                  color: Color(0xFF0D5D44),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.w),
                      bottomRight: Radius.circular(25.w))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 41.w),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home()));
                              },
                              color: Colors.white,
                              icon: Icon(Icons.arrow_back)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 180.w),
                          child: IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(Icons.access_time_filled)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.w),
                          child: IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              icon: Icon(Icons.push_pin)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0.w),
                          child: IconButton(
                              onPressed: () {},
                              color: Colors.white,
                              iconSize: 35,
                              icon: Icon(Icons.check_outlined)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    child: Text(
                      'UX Basics',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                      //  textScaleFactor: 1.0,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10.w),
                width: 341.w,
                height: 363.w,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'enter yor details'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
