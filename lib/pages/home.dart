import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    bool hasData = data.isNotEmpty;

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/location");
                },
                child: Row(
                  children: [
                    Icon(Icons.map, color: Colors.grey[700]),
                    Text(
                      "change location",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                )),
            hasData
                ? Text(
                    "${data["locationUI"]}",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  )
                : SpinKitThreeBounce(
                    color: Colors.white,
                    size: 24.0,
                  ),
            SizedBox(
              height: 8,
            ),
            hasData
                ? Text(
                    "${data["hour"]}",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  )
                : SpinKitThreeBounce(
                    color: Colors.white,
                    size: 24.0,
                  ),
          ],
        ),
      ),
    );
  }
}
