
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:air_quality/air_quality.dart';

class aqiscreen extends StatefulWidget {
  @override
  _aqiscreenState createState() => _aqiscreenState();
}

class _aqiscreenState extends State<aqiscreen> {
  //String _key = 'de113a567839c4ae761b35831192453ae5f57551';
  AirQuality airQuality =
      new AirQuality('de113a567839c4ae761b35831192453ae5f57551');
  @override
  void initState() {
    super.initState();
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
  String aqi = '';
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
              child: GooglePlaceAutoCompleteTextField(
                  textEditingController: _controller,
                  googleAPIKey: "---API--KEY---",
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
            Center(child: Text('AQI :' + aqi))
          ],
        ),
      ),
    );
  }
}
