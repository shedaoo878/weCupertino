import 'package:flutter/material.dart';



class cards extends StatelessWidget {
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

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new homescreen();

}

class homescreen extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino")
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            new Text("Safe Routes"),
            new Text("Events")
          ],
        ),
      ),
    );
  }

}