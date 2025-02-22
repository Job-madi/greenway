import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  /*final Set<Polyline> polyline = {};
  GoogleMapController _controller;
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline = new GoogleMapPolyline(apiKey: "AIzaSyBXM9e9oKVFo1mcXEtidvG89h_MDwL-bxg");

  getsomePoints()async {
    var permissions = await Permission.getPermissionsStatus(
        [PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askpermissions = await Permission.requestPermissions(
          [PermissionName.Location]);
    }
else{
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(40.6782, -73.9442),
        destination: LatLng(40.6782, -89.9442),
        mode: RouteMode.bicycling);
  }
  }

  getaddressPoints()async{
    routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(origin: '55 Kingston Ave, Brooklyn, NY 11213, USA', destination: '178 Broadway, Brooklyn, NY 11211, USA', mode: RouteMode.bicycling);
  }

  @override
  void initState(){
    super.initState();
    getsomePoints();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFffbd59),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Starting Point",
                    border: InputBorder.none,
                    filled: true,
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
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
                child: Text(
                  "GO",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  side: BorderSide(color: Colors.black, width: 2.5),
                ),
                height: 30,
                minWidth: 50,
                color: Colors.black.withOpacity(0.0),
              ),
              Container(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
