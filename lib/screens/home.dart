import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_notes/helper/db_helper.dart';
import 'package:sticky_notes/model/notes.dart';
import 'package:sticky_notes/screens/detail.dart';
import 'package:sticky_notes/screens/showDetail.dart';
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
                        ),
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
            Container(
              margin: EdgeInsets.only(top: 228.w, left: 10.w, right: 10.w),
              width: 375.w,
              height: 500.w,
              color: Colors.transparent,
              child: Material(
                color: Colors.transparent,
                child: FutureBuilder(
                    future: DbHelper.dbHelper.getAllNotes(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Notes> notes = snapshot.data;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  //  maxCrossAxisExtent: 200.w,
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.w / 2.w,
                                  crossAxisSpacing: 20.w,
                                  mainAxisSpacing: 20.w),
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return Note_widget(
                              title: notes[index].title,
                              contain: notes[index].contain,
                              date: notes[index].date,
                              function: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ShowDetail(
                                          notes: Notes(
                                              id: notes[index].id,
                                              title: notes[index].title,
                                              contain: notes[index].contain,
                                              date: notes[index].date),
                                        )));
                              },
                            );
                          },
                        );
                      }
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 713.w
                  //  top: 730.w,
                  ),
              width: 375.w,
              height: 55.w,
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
                      margin: EdgeInsets.only(left: 15.w),
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
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 680.w),
                child: FloatingActionButton(
                    backgroundColor: Color(0xFFFA8704),
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage()));
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
