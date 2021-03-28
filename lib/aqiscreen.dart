import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:air_quality/air_quality.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Aqiscreen extends StatefulWidget {
  @override
  _AqiscreenState createState() => _AqiscreenState();
}

class _AqiscreenState extends State<Aqiscreen> {
 // String _key = 'de113a567839c4ae761b35831192453ae5f57551';
  
  AirQuality airQuality;

  @override
  void initState() {
    super.initState();
    airQuality = new AirQuality('de113a567839c4ae761b35831192453ae5f57551');
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
                child:
                    Image.network("https://i.ibb.co/X7BkM0f/1616920396411.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: GooglePlaceAutoCompleteTextField(
                  textEditingController: _controller,
                  googleAPIKey: "AIzaSyDyCqyYlxIkhhtDAzoCgwqlfkVTwGYDIo4",
                  inputDecoration: InputDecoration(
                    filled: true,
                    hintText: 'Enter City',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  debounceTime: 800,
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (Prediction prediction) {
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
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 140,
                    endAngle: 400,
                    minimum: 0,
                    maximum: 500,
                    axisLineStyle: AxisLineStyle(thickness: 50),
                    majorTickStyle: MajorTickStyle(
                      length: 0,
                    ),
                    minorTickStyle: MinorTickStyle(
                      length: 0,
                    ),
                    labelOffset: -65,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green[800],
                        startWidth: 50,
                        endWidth: 50,
                        label: 'good',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                      GaugeRange(
                        startValue: 50,
                        endValue: 100,
                        color: Color(0xFFffff00),
                        startWidth: 50,
                        endWidth: 50,
                        label: 'Moderate',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                      GaugeRange(
                        startValue: 100,
                        endValue: 150,
                        color: Color(0xFFff7e00),
                        startWidth: 50,
                        endWidth: 50,
                        label: 'Unhealthy\nfor Sensitive\n Groups',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                      GaugeRange(
                        startValue: 150,
                        endValue: 200,
                        color: Color(0xFFfe0000),
                        startWidth: 50,
                        endWidth: 50,
                        label: 'Unhealthy',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                      GaugeRange(
                        startValue: 200,
                        endValue: 300,
                        color: Color(0xFF99004c),
                        startWidth: 50,
                        endWidth: 50,
                        label: 'Very Unhealthy',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                      GaugeRange(
                        startValue: 300,
                        endValue: 500,
                        color: Color(0xFF7e0022),
                        startWidth: 50,
                        endWidth: 50,
                        label: 'Hazardous',
                        labelStyle: GaugeTextStyle(fontSize: 11),
                      ),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: double.parse(aqi),
                      )
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            aqi,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.75,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
