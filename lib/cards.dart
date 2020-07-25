////import 'package:cupertino_pride/SafeRoutes.dart';
////import 'package:cupertino_pride/events.dart';
////import 'package:cupertino_pride/polls.dart';
////import 'package:cupertino_pride/vote.dart';
//import 'package:cupertino_pride/GoogleSignIn.dart';
//import 'package:cupertino_pride/SafeRoutes.dart';
//import 'package:cupertino_pride/Voting.dart';
//import 'package:cupertino_pride/events.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase/firebase.dart';
//import 'package:firebase/firestore.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//
//
//
//// ignore: camel_case_types
//class cards2 extends StatelessWidget {
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Home Page",
//      home: HomeScreen(),
//      routes: <String, WidgetBuilder>{
//        "Events": (BuildContext context) => new Events(),
//        "Voting": (BuildContext context) => new Voting(),
//        "Safety": (BuildContext context) => new Safety(),
//      },
//    );
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//}
//
//Color lightBlueIsh = Color(0xFF07489C);
//Color lightGreen = Color(0xFF33BBB5);
//
//class HomeScreen extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => new homescreen();
//}
//
//class homescreen extends State<StatefulWidget> {
//
////  WelcomeUserWidget userinfo = new WelcomeUserWidget(FirebaseUser user, signIn)
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            DrawerHeader(
//
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//              child: Text(
//                'Your Profile',
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 24,
//                ),
//              ),
//            ),
//            ListTile(
//              leading: Icon(Icons.event),
//              title: Text('Events'),
//              onTap: () => {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => Events()))
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.directions_bike),
//              title: Text('Safe Routes'),
//              onTap: () => {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => Safety()))
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.account_balance),
//              title: Text('Voting'),
//              onTap: () => {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => Voting()))
//              },
//            ),
////            ListTile(
////              leading: Icon(Icons.remove_red_eye),
////              title: Text('Stored Equations'),
////              onTap: () => {
////                Navigator.push(context,
////                    MaterialPageRoute(builder: (context) => ()))
////              },
////            ),
////            ListTile(
////              leading: Icon(Icons.edit),
////              title: Text('Log an Equations'),
////              onTap: () => {
////                Navigator.push(context,
////                    MaterialPageRoute(builder: (context) => LogAnEquation()))
////              },
////            ),
//          ],
//        ),
//      ),
//      backgroundColor: Color(0xFF083663),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.all(40),
//                  constraints: BoxConstraints.expand(height: 175),
//                  decoration: BoxDecoration(
//                      gradient: new LinearGradient(
//                          begin: const FractionalOffset(1.0, 1.0),
//                          colors: [lightGreen, lightBlueIsh],
//                          end: const FractionalOffset(0.2, 0.2),
//                          stops: [0.0, 1.0],
//                          tileMode: TileMode.clamp),
//                      borderRadius: BorderRadius.only(
//                          bottomLeft: Radius.circular(0),
//                          bottomRight: Radius.circular(0))),
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          'Welcome',
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              height: 1,
//                              fontSize: 30,
//                              color: Colors.white),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 500,
//                  margin: EdgeInsets.only(top: 200),
//                  padding: EdgeInsets.all(20),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.only(top: 40),
//                        child: Center(
//                          child: Text(
//                            "Explore Your Community",
//                            style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                height: 1,
//                                color: Colors.white,
//                                fontSize: 20),
//                          ),
//                        ),
//                      ),
//                      Container(
//                        height: 400,
//                        child: ListView(
//                          children: getJobCategories(),
//                        ),
//                      )
//                    ],
//                  ),
//                )
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  List<String> Categories = [
//    "Safety",
//    "Events",
//    "Voting",
//    "Polls",
//    "News",
//    "Resources"
//  ];
//
//  Map jobIcon = {
//    "Safety": Icon(
//      Icons.directions_bike,
//      color: Color(0xFF083663),
//      size: 50,
//    ),
//    "Events": Icon(Icons.calendar_today, color: Color(0xFF083663), size: 50),
//    "Voting": Icon(Icons.account_balance, color: Color(0xFF083663), size: 50),
//    "Polls": Icon(Icons.poll, color: Color(0xFF083663), size: 50),
//    "News": Icon(Icons.schedule, color: Color(0xFF083663), size: 50),
//    "Resources": Icon(Icons.info, color: Color(0xFF083663), size: 50),
//  };
//
//  Widget getCategoryContainer(String categoryName) {
//    return new Container(
//      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
//      height: 180,
//      width: 140,
//      padding: EdgeInsets.all(10),
//      decoration: BoxDecoration(
//        color: Colors.white,
//        borderRadius: BorderRadius.all(Radius.circular(15)),
//        boxShadow: [
//          new BoxShadow(
//            color: Colors.blueGrey[900],
//            blurRadius: 10.0,
//          ),
//        ],
//      ),
//      child: Column(
//        children: <Widget>[
//          Text(categoryName),
//          Container(
//            padding: EdgeInsets.only(top: 30),
//            height: 100,
//            width: 70,
//            child: new FloatingActionButton(
//              heroTag: categoryName,
//              backgroundColor: Colors.white,
//              child: jobIcon[categoryName],
//              elevation: 10,
//              onPressed: () {
//                Navigator.of(context).pushNamed(categoryName);
//              },
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  List<Widget> getJobCategories() {
//    List<Widget> jobCategoriesCards = [];
//    List<Widget> rows = [];
//    int i = 0;
//    for (String category in Categories) {
//      if (i < 2) {
//        rows.add(getCategoryContainer(category));
//        i++;
//      } else {
//        i = 0;
//        jobCategoriesCards.add(new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: rows,
//        ));
//        rows = [];
//        rows.add(getCategoryContainer(category));
//        i++;
//      }
//    }
//    if (rows.length > 0) {
//      jobCategoriesCards.add(new Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: rows,
//      ));
//    }
//    return jobCategoriesCards;
//  }
//}
