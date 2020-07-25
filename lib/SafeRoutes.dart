import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Safety extends StatefulWidget {
  @override
  PolylineState createState() => PolylineState();
}

class PolylineState extends State<Safety> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController controller;

  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  List<LatLng> latlngSegment3 = List();
  List<LatLng> latlngSegment4 = List();
  List<LatLng> latlngSegment5 = List();
  List<LatLng> latlngSegment6 = List();
  List<List<LatLng>> doubleArray = List();

  static LatLng _lat1 = LatLng(37.322925, -122.049219);
  static LatLng _lat2 = LatLng(37.322998, -122.005994);
  static LatLng _lat3 = LatLng(12.970387, 77.693621);
  static LatLng _lat4 = LatLng(12.858433, 77.575691);
  static LatLng _lat5 = LatLng(12.948029, 77.472936);
  static LatLng _lat6 = LatLng(13.069280, 77.455844);
  static LatLng _lat7 = LatLng(12.970387, 77.693621);
  static LatLng _lat8 = LatLng(12.858433, 77.575691);
  static LatLng _lat9 = LatLng(12.948029, 77.472936);
  static LatLng _lat10 = LatLng(13.069280, 77.455844);
  static LatLng _lat11 = LatLng(12.948029, 77.472936);
  static LatLng _lat12 = LatLng(13.069280, 77.455844);
  LatLng _lastMapPosition = LatLng(37.3230, -122.0322);

  @override
  void initState() {
    doubleArray.add(latlngSegment1);
    doubleArray.add(latlngSegment2);
    doubleArray.add(latlngSegment3);
    doubleArray.add(latlngSegment4);
    doubleArray.add(latlngSegment5);
    doubleArray.add(latlngSegment6);

    super.initState();
    //line segment 1
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);

    latlngSegment2.add(_lat3);
    latlngSegment2.add(_lat4);

    latlngSegment3.add(_lat5);
    latlngSegment3.add(_lat6);

    latlngSegment4.add(_lat7);
    latlngSegment4.add(_lat8);

    latlngSegment5.add(_lat9);
    latlngSegment5.add(_lat10);

    latlngSegment5.add(_lat11);
    latlngSegment5.add(_lat12);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lastMapPosition,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
//      _markers.add(Marker(
//        // This marker id can be anything that uniquely identifies each marker.
//        markerId: MarkerId(_lastMapPosition.toString()),
//        //_lastMapPosition is any coordinate which should be your default
//        //position when map opens up
//        position: _lastMapPosition,
//        infoWindow: InfoWindow(
//          title: 'Awesome Polyline tutorial',
//          snippet: 'This is a snippet',
//        ),
//      ));


      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 4,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors

    });
  }
}
