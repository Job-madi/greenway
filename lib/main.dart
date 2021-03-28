/* the code starts from this screen. This screen has static elements and two buttons. The buttons navigate to routescreen
* and aqiscreen respectively*/



import 'package:flutter/material.dart';
import 'routescreen.dart';
import 'aqiscreen.dart';

void main()=> runApp(MyApp());

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Greenway",
          theme: ThemeData(
             primarySwatch: Colors.amber,
          ),
          home: Homepage(),
        );
      }
    }


    class Homepage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: Container(

              color: Color(0xFFffbd59),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://i.ibb.co/fCD64JQ/Untitled-design-4.png"),
                    radius: 40,

                  ),
                  Image.network("https://i.ibb.co/nnMZ6Jw/1616863866247.png"),
                  MaterialButton(
                    elevation: 0.0,
                    child: Text("Find best route",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) => RouteScreen()
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      side: BorderSide(color: Colors.white, width: 2.5),

                    ),
                    height: 60,
                    minWidth: 250,


                    color: Colors.black.withOpacity(0.0),

                  ),
                  MaterialButton(
                    elevation: 0.0,
                    child: Text("AQI around the world",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(

                            builder: (context) => Aqiscreen()
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      side: BorderSide(color: Colors.white, width: 2.5),

                    ),
                    height: 60,
                    minWidth: 250,


                    color: Colors.black.withOpacity(0.0),

                  ),
                  Image.network("https://i.ibb.co/6wfmfN8/1616863894612.png", height: 250),
                ],
              ),
            ),
          ),
        );
      }
    }

