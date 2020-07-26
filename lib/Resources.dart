import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'GoogleSignIn.dart';


class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomeScreen(),
    );
    // TODO: implement build
  }
}

Color lightBlueIsh = Color(0xFF07489C);
Color lightGreen = Color(0xFF33BBB5);




_launchURL(String temp) async {
  var url = "";
  if (temp.compareTo('Teen Resources') == 0)
    {url = 'https://www.cupertino.org/residents/resources-and-services/resources-for-teens';}
  else if (temp.compareTo('Senior Resources') == 0)
  {url = 'https://www.cupertino.org/our-city/departments/parks-recreation/cupertino-senior-center/services-for-seniors/resources-for-seniors';}
  else if (temp.compareTo('Coronavirus') == 0)
  {url = 'https://www.cupertino.org/our-city/city-news/coronavirus-covid-19/-fsiteid-1';}
  else if (temp.compareTo('City Contact') == 0)
  {url = 'https://www.cupertino.org/i-want-to/contact-the-city';}


  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}

// ignore: camel_case_types
class homescreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF07489C),
        title: Text('Resources'),
        centerTitle: true,
        leading: IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => cards())); }, icon: Icon(Icons.arrow_back)),

      ),
      backgroundColor: Color(0xFF083663),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 175),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                          begin: const FractionalOffset(1.0, 1.0),
                          colors: [lightGreen, lightBlueIsh],
                          end: const FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
//                          user1 == null? 'Welcome' : 'Welcome ' + user1.displayName,
                          'Resources',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1,
                              fontSize: 30,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 200),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Center(
                          child: Text(
                            "Availabe Resources",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        child: ListView(
                          children: getJobCategories(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<String> Categories = [
  "Teen Resources",
  "Senior Resources",
  "Coronavirus",
  "City Contact",
];

Map jobIcon = {
  "Teen Resources": Icon(Icons.create, color: Color(0xFF083663), size: 50),
  "Senior Resources": Icon(Icons.healing, color: Color(0xFF083663), size: 50),
  "Coronavirus": Icon(Icons.local_hospital, color: Color(0xFF083663), size: 50),
  "City Contact":
      Icon(Icons.question_answer, color: Color(0xFF083663), size: 50),
};

Widget getCategoryContainer(String categoryName) {
  return new Container(
    margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
    height: 180,
    width: 140,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        new BoxShadow(
          color: Colors.blueGrey[900],
          blurRadius: 10.0,
        ),
      ],
    ),
    child: Column(
      children: <Widget>[
        Text(categoryName),
        Container(
          padding: EdgeInsets.only(top: 30),
          height: 100,
          width: 70,
          child: new FloatingActionButton(
            heroTag: categoryName,
            backgroundColor: Colors.white,
            child: jobIcon[categoryName],
            elevation: 10,
              onPressed: () => {_launchURL(categoryName)},
          ),
        )
      ],
    ),
  );
}

List<Widget> getJobCategories() {
  List<Widget> jobCategoriesCards = [];
  List<Widget> rows = [];
  int i = 0;
  for (String category in Categories) {
    if (i < 2) {
      rows.add(getCategoryContainer(category));
      i++;
    } else {
      i = 0;
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
      rows = [];
      rows.add(getCategoryContainer(category));
      i++;
    }
  }
  if (rows.length > 0) {
    jobCategoriesCards.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    ));
  }
  return jobCategoriesCards;
}
