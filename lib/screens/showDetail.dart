import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sticky_notes/helper/db_helper.dart';
import 'package:sticky_notes/model/notes.dart';

import 'dart:math';

import 'package:sticky_notes/screens/home.dart';

class ShowDetail extends StatefulWidget {
  Notes notes = Notes();

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE').add_jm();

  ShowDetail({this.notes});

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  TextEditingController titleController = TextEditingController();

  TextEditingController containController = TextEditingController();

  method1() {
    titleController.text = this.widget.notes.title;
    containController.text = this.widget.notes.contain;
  }

  final String date = ShowDetail.formatter.format(ShowDetail.now);
  @override
  void initState() {
    super.initState();
    method1();
  }

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
                              onPressed: () async {
                                await DbHelper.dbHelper.updateNote(Notes(
                                    id: this.widget.notes.id,
                                    title: titleController.text,
                                    contain: containController.text,
                                    date: this.widget.notes.date));
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home()));
                              },
                              color: Colors.white,
                              icon: Icon(Icons.edit)),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 0.w),
                            child: Transform.rotate(
                              angle: 30 * pi / 180,
                              child: IconButton(
                                  onPressed: () async {
                                    await DbHelper.dbHelper
                                        .deleteNote(this.widget.notes.id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  color: Colors.white,
                                  icon: Icon(Icons.delete)),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.w),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          //  hintText: this.widget.notes.title,
                          hintStyle: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                          fillColor: Color(0xFF0D5D44)),
                    ),
                    // child: Text(
                    //   'UX Basics',
                    //   style: TextStyle(
                    //       color: Color(0xFFFFFFFF),
                    //       fontSize: 20.sp,
                    //       fontWeight: FontWeight.bold),
                    //   //  textScaleFactor: 1.0,
                    // ),
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
                  controller: containController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    //    hintText: this.widget.notes.contain
                  ),
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
