import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Note_widget extends StatelessWidget {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('EEEE').add_jm();

  final String formatted = formatter.format(now);

  String title;
  String contain;
  String date;
  Function function;
  Note_widget({this.title, this.contain, this.date, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      width: 160.w,
      height: 180.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Text(this.title)),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: this.function, icon: Icon(Icons.more_vert)))
            ],
          ),
          Container(
            height: 40.w,
            alignment: Alignment.topLeft,
            child: Text(
              this.contain,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            height: 20.w,
            alignment: Alignment.bottomLeft,
            child: Text(this.date),
          )
        ],
      ),
    );
  }
}
