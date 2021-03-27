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
          body: Container(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://i.ibb.co/fCD64JQ/Untitled-design-4.png"),
                ),
                Image.network("https://i.ibb.co/nnMZ6Jw/1616863866247.png"),
                MaterialButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(

                     // builder: (context) => routescreen(),
                    ),
                  );
                },
                  height: 50, minWidth: 200,

                ),
                MaterialButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(

                      // builder: (context) => aqiscreen(),
                    ),
                  );
                },
                  height: 50, minWidth: 200,
                ),
                Image.network("https://i.ibb.co/nnMZ6Jw/1616863866247.png"),
              ],
            ),
          ),
        );
      }
    }

