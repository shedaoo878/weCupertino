import 'package:cupertino_pride/SafeRoutes.dart';
import 'package:flutter/material.dart';

class events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomeScreen(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}

class homescreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff537895),
        ),
        child: new Center(
          child: new Row(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton.icon(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SafeRoutes()))
                },
                label: Text(
                  'Event',
                ),
                icon: Icon(Icons.event),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
