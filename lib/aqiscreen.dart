import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aqiscreen extends StatefulWidget {
  @override
  _aqiscreenState createState() => _aqiscreenState();
}

class _aqiscreenState extends State<aqiscreen> {
  String country;
  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffbd59),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'AQI',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  //hoverColor: Colors.black,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Enter Country',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  country = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  //hoverColor: Colors.black,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Enter City',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (value) {
                  city = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
