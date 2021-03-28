import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFffbd59),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Starting Point",
                    border: InputBorder.none,
                    filled: true,
                    contentPadding: EdgeInsets.all(15.0),

                  ),

                ),
            ),
            Padding(padding: EdgeInsets.only(top: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Destination",
                  border: InputBorder.none,
                  filled: true,
                  contentPadding: EdgeInsets.all(15.0),

                ),

              ),
            ),
            MaterialButton(
              elevation: 0.0,
              child: Text("GO",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                ),),
              onPressed: (){
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
                side: BorderSide(color: Colors.black, width: 2.5),

              ),
              height: 30,
              minWidth: 50,


              color: Colors.black.withOpacity(0.0),

            ),
            Container(
              height: 400,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

}
