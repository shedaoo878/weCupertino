import 'package:flutter/material.dart';


class events extends StatelessWidget {
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

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}


// ignore: camel_case_types
class homescreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF083663),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 12,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Event at Wilson Park',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text('7/4 at 3:00PM',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.white)),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: Colors.white,
                            )
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
    );
  }
}