import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/pages/choose_location.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:flutter_world_time_app/pages/loading.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => ChooseLocation()
      },
    );
  }
}
