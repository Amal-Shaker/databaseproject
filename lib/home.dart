import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_notes/detail.dart';
import 'package:sticky_notes/widget/note_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFFF2F0F0),
      width: 375.w,
      height: 812.w,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 0.w, left: 0.w),
                  padding: EdgeInsets.only(top: 60.w),
                  width: 375.w,
                  height: 298.w,
                  decoration: BoxDecoration(
                      color: Color(0xFF0D5D44),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.w),
                          bottomRight: Radius.circular(25.w))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 16.w,
                          // top: 60.h,
                        ),
                        // width: 50.w,
                        // height: 26.h,
                        child: Text(
                          'My Notes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Montserrat-Bold',
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            //  top: 60.h,
                            right: 14.w),
                        width: 189.w,
                        height: 150.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/image2.png'),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                ),
              ],
            ),

            Note_widget(),

            Container(
              margin: EdgeInsets.only(bottom: 0.w, top: 747.w
                  //  top: 730.w,
                  ),
              width: 375.w,
              height: 65.w,
              padding: EdgeInsets.only(top: 20.w),
              // height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.w),
                      topRight: Radius.circular(25.w))),

              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w, top: 20.w),
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/setting.png'))),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 38.w),
                      width: 40.w,
                      height: 25.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/group.png'))),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 147.w),
                      width: 28.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/gallery.png'))),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 44.w),
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/information.png'))),
                    ),
                    onTap: () {},
                  )
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.settings,
                  //       size: 24,
                  //       color: Color(0xFFD3D3D3),
                  //     )),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.folder_outlined,
                  //       size: 24,
                  //       color: Color(0xFFD3D3D3),
                  //     )),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.camera_enhance,
                  //       size: 50,
                  //       color: Color(0xFFD3D3D3),
                  //     ))
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 720.w),
                child: FloatingActionButton(
                    backgroundColor: Color(0xFFFA8704),
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage()));
                    }),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 30),
            //   child: Text('hello'),
            // )
          ],
        ),
      ),
    ));
  }
}
