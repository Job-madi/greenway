
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:air_quality/air_quality.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class aqiscreen extends StatefulWidget {
  @override
  _aqiscreenState createState() => _aqiscreenState();
}

class _aqiscreenState extends State<aqiscreen> {
 // String _key = 'de113a567839c4ae761b35831192453ae5f57551';
  AirQuality airQuality;

  @override
  void initState() {
    super.initState();
    airQuality = new AirQuality('--AQI api key--');
  }

  void getData(double lat, double lon) async {
    AirQualityData feedFromGeoLocation =
    await airQuality.feedFromGeoLocation(lat, lon);
    setState(() {
      aqi = feedFromGeoLocation.airQualityIndex.toString();
    });
  }

  final _controller = TextEditingController();
  double lat;
  double lon;
  String aqi = '0';
  String city = '';
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
                child: Image.network("https://i.ibb.co/X7BkM0f/1616920396411.png"),
              ),
            ),
            Container(

              padding: EdgeInsets.all(20.0),
              child: GooglePlaceAutoCompleteTextField(
                  textEditingController: _controller,
                  googleAPIKey: "--Your API key--",
                  inputDecoration: InputDecoration(
                    //hoverColor: Colors.black,
                    filled: true,
                    //fillColor: Colors.black,
                    hintText: 'Enter City',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  debounceTime:
                  800, // default 600 ms, // optional by default null is set
                  isLatLngRequired:
                  true, // if you required coordinates from place detail
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    // this method will return latlng with place detail

                    print("placeDetails " +
                        prediction.lat.toString() +
                        " " +
                        prediction.lng.toString());
                    lat = double.parse(prediction.lat);
                    lon = double.parse(prediction.lng);
                    city = prediction.description;
                    getData(lat, lon);
                  }, // this callback is called when isLatLngRequired is true
                  itmClick: (Prediction prediction) {
                    _controller.text = prediction.description;
                    _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: prediction.description.length));
                  }),
            ),


              Container(
               // padding: ,
                child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(startAngle : 140, endAngle : 400,  minimum: 0, maximum: 500,
                      axisLineStyle: AxisLineStyle(thickness: 50),
                      majorTickStyle: MajorTickStyle(length: 0,),
                      minorTickStyle: MinorTickStyle(length: 0,),
                      labelOffset: -60,


                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 50,
                            color:Colors.green,
                            startWidth: 50,
                            endWidth: 50,
                            label: 'good',
                            labelStyle: GaugeTextStyle(fontSize: 11)
                        ),
                        GaugeRange(
                            startValue: 50,
                            endValue: 100,
                            color: Colors.yellow,
                            startWidth: 50,
                            endWidth: 50,
                            label: 'Moderate',
                            labelStyle: GaugeTextStyle(fontSize: 11)
                        ),
                        GaugeRange(
                            startValue: 100,
                            endValue: 150,
                            color: Colors.orange,
                            startWidth: 50,endWidth: 50 ,
                            label : 'Unhealthy\nfor Sensitive\n Groups', labelStyle: GaugeTextStyle(fontSize: 11) ),
                        GaugeRange(
                            startValue: 150,
                            endValue: 200,
                            color: Colors.red,
                            startWidth: 50,
                            endWidth: 50 ,
                            label: 'Unhealthy',
                            labelStyle: GaugeTextStyle(fontSize: 11)
                        ),
                        GaugeRange(
                            startValue: 200,
                            endValue: 300,
                            color: Colors.pink,
                            startWidth: 50,
                            endWidth: 50,
                            label: 'Very Unhealthy',
                            labelStyle: GaugeTextStyle(fontSize: 11)
                        ),
                        GaugeRange(
                            startValue: 300,
                            endValue: 500,
                            color: Colors.purple,
                            startWidth: 50,
                            endWidth: 50 ,
                            label: 'Hazardous',
                            labelStyle: GaugeTextStyle(fontSize: 11)
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: double.parse(aqi))],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(widget: Container(child:
                        Text(aqi,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                            angle: 90, positionFactor: 0.75
                        )]
                  )])
          ),
         ],

        ),

      ),
    );
  }
}
