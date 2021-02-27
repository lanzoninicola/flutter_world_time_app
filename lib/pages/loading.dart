import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    print("setuTime() is fired");
    WorldTime wtInstance = WorldTime(
        locationUI: 'Berlin',
        flag: 'germany.png',
        locationURL: 'Europe/Berlin');

    

    await wtInstance.getTime();

    print("loading.dart - wtInstate.locationUI $wtInstance");

    if (wtInstance.locationUI != null) {
      switchToHome({
        "locationUI": wtInstance.locationUI,
        "flag": wtInstance.flag,
        "date": wtInstance.date,
        "hour": wtInstance.hour,
      });
    }
  }

  void switchToHome(data) {
    Navigator.pushReplacementNamed(context, '/home', arguments: data);
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    ));
  }
}
