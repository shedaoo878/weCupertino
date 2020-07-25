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

  List<LatLng> latlngSegment7 = List();
  List<LatLng> latlngSegment8 = List();
  List<LatLng> latlngSegment9 = List();
  List<LatLng> latlngSegment10 = List();
  List<LatLng> latlngSegment11 = List();
  List<LatLng> latlngSegment12 = List();
  List<LatLng> latlngSegment13 = List();

  List<List<LatLng>> doubleArray = List();

  static LatLng _lat1 = LatLng(37.322925, -122.049219);
  static LatLng _lat2 = LatLng(37.322998, -122.005994);

  static LatLng _lat3 = LatLng(37.315499, -122.050507);
  static LatLng _lat4 = LatLng(37.300990, -122.050306);

  static LatLng _lat5 = LatLng(37.315572, -122.050493);
  static LatLng _lat6 = LatLng(37.315698, -122.032328);

  static LatLng _lat7 = LatLng(37.337649, -122.032298);
  static LatLng _lat8 = LatLng(37.294012, -122.032241);

  static LatLng _lat9 = LatLng(37.309777, -122.023352);
  static LatLng _lat10 = LatLng(37.337142, -122.023269);

  static LatLng _lat11 = LatLng(37.337542, -122.041482);
  static LatLng _lat12 = LatLng(37.337689, -122.014285);



  static LatLng _lat13 = LatLng(37.312365, -122.032090);
  static LatLng _lat14 = LatLng(37.309888, -122.023302);

  static LatLng _lat15 = LatLng(37.316223, -122.032322);
  static LatLng _lat16 = LatLng(37.316046, -122.023186);


  static LatLng _lat17 = LatLng(37.337527, -122.041542);
  static LatLng _lat18 = LatLng(37.300920, -122.041386);


  static LatLng _lat19 = LatLng(37.337626, -122.014397);
  static LatLng _lat20 = LatLng(37.322884, -122.014301);

  static LatLng _lat21 = LatLng(37.337542, -122.041482);
  static LatLng _lat22 = LatLng(37.337689, -122.014285);

  static LatLng _lat23 = LatLng(37.337542, -122.041482);
  static LatLng _lat24 = LatLng(37.337689, -122.014285);

  static LatLng _lat25 = LatLng(37.337542, -122.041482);
  static LatLng _lat26 = LatLng(37.337689, -122.014285);

  LatLng _lastMapPosition = LatLng(37.3230, -122.0322);

  @override
  void initState() {


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

    latlngSegment6.add(_lat11);
    latlngSegment6.add(_lat12);

    latlngSegment7.add(_lat13);
    latlngSegment7.add(_lat14);

    latlngSegment8.add(_lat15);
    latlngSegment8.add(_lat16);

    latlngSegment9.add(_lat17);
    latlngSegment9.add(_lat18);

    latlngSegment10.add(_lat19);
    latlngSegment10.add(_lat20);

    latlngSegment11.add(_lat21);
    latlngSegment11.add(_lat22);

    latlngSegment12.add(_lat23);
    latlngSegment12.add(_lat24);

    latlngSegment13.add(_lat25);
    latlngSegment13.add(_lat26);
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
          zoom: 15.0,
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


      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line3'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment3,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line4'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment4,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line5'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment5,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line6'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment6,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line7'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment7,
        width: 4,
        color: Colors.blue,
      ));


      _polyline.add(Polyline(
        polylineId: PolylineId('line8'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment8,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line9'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment9,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line10'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment10,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line11'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment11,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line12'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment12,
        width: 4,
        color: Colors.blue,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line13'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment13,
        width: 4,
        color: Colors.blue,
      ));
      //different sections of polyline can have different colors

    });
  }
}
