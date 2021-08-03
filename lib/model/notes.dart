import 'package:sticky_notes/helper/db_helper.dart';

class Notes {
  int id;
  String title;
  String contain;
  String date;

  Notes({this.id, this.title, this.contain, this.date});
  toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'contain': this.contain,
      'date': this.date
    };
  }

  Notes.fromMap(Map map) {
    this.id = map[DbHelper.columnId];
    this.title = map[DbHelper.columnTitle];
    this.contain = map[DbHelper.columnContain];
    this.date = map[DbHelper.columnDate];
  }
}
