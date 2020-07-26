import 'package:flutter/material.dart';

import 'GoogleSignIn.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomeScreen(),
    );
    // TODO: implement build
  }
}

List<String> events = [
  "Shakespeare In the Park",
  "Bell Ringing Ceremony",
  "Planning Commision ",

  "Housing Comission ",
  "Teen Commission "
];

List<String> dates = [
  "8/1/2020",
  "8/5/2020",
  "8/11/2020",
  "8/13/2020",
  "8/14/2020"

];

Color lightBlueIsh = Color(0xFF07489C);
Color lightGreen = Color(0xFF33BBB5);

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}

// ignore: camel_case_types
class homescreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF07489C),
          title: Text('Upcoming Events'),
          centerTitle: true,
          leading: IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => cards())); }, icon: Icon(Icons.arrow_back)),

        ),
        backgroundColor: Color(0xFF083663),
        body: SafeArea(
          child: new Container(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    margin: EdgeInsets.all(16),
                    child: Stack(
                      children: <Widget>[
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 36),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.teal,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.event,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 16,
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        events[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(color: Colors.white),
                                      ),

                                      Text(dates[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),

                                IconButton(
                                    icon: Icon(Icons.navigate_next,
                                      size: 36,
                                      color: Colors.white,),
                                    onPressed:() => {})
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 12,
                          child: Icon(
                            Icons.add_location,
                            size: 32,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
