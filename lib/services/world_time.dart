import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String locationUI;
  String flag;
  String locationURL;
  
  DateTime fullDate;
  String fullStrDate;
  String date;
  String hour;

  WorldTime({this.locationUI, this.flag, this.locationURL});

  Future<void> getTime() async {
    Response response =
        await get("http://worldtimeapi.org/api/timezone/$locationURL");
    Map data = jsonDecode(response.body);

    String utcDatetime = data["utc_datetime"];
    String utcOffset = data["utc_offset"];

    DateTime utcNow = DateTime.parse(utcDatetime);
    int utcOffsetInt = int.parse(utcOffset.substring(1, 3));
    String utcOffsetSign = utcOffset.substring(0, 1);

    DateTime localNow;
    if (utcOffsetSign == "-") {
      localNow = utcNow.subtract(Duration(hours: utcOffsetInt));
    }

    if (utcOffsetSign == "+") {
      localNow = utcNow.add(Duration(hours: utcOffsetInt));
    }

    fullDate = localNow;
    fullStrDate = localNow.toString();
    date = DateFormat('yMd').format(localNow);
    hour = DateFormat.jm().format(localNow);
  }
}
