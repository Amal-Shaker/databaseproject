import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Note_widget extends StatelessWidget {
  static final DateTime now = DateTime.now();
  static final DateFormat formatter =
      // DateFormat('kk:mm:ss  EEE d MMM').add_jm();
      DateFormat('EEEE').add_jm();

  final String formatted = formatter.format(now);
  // final now = new DateTime.now();
  // final DateTime dt =
  //     DateTime(now.year, now.month, now.day, now.hour, now.minute);
  // final DateFormat format = DateFormat.jm(); //"6:00 AM"
  // String formatte = format.format(dt);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, top: 228.w),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      width: 160.w,
      height: 180.w,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: Text('summery')),
              Expanded(
                  flex: 1,
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)))
            ],
          ),
          Container(
            child: Text(
              'hello every one welcome to yor container , i am happy to visit my application thank you very match hello every one welcome to yor container , i am happy to visit my application thank you very match ',
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(1),
            child: Text(formatted),
            // print(formatted);
          )
        ],
      ),
    );
  }
}
