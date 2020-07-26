
import 'package:cupertino_pride/Resources.dart';
import 'package:cupertino_pride/events.dart';
import 'package:cupertino_pride/polls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SafeRoutes.dart';
import 'Voting.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
FirebaseUser user1;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;


  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  user1 = user;
  return 'signInWithGoogle succeeded: $user'; //change
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

class GoogleSignInw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "sign In pge",
      home: signInConnector(),
    );
  }
}

class signInConnector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new googleSignInPage();
}

class googleSignInPage extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              color: Color(0xFF083663),
//            decoration: BoxDecoration(
//                gradient: new LinearGradient(
//                    begin: const FractionalOffset(1.0, 1.0),
//                    colors: [Colors.lightGreen, Colors.lightBlue],
//                    end: const FractionalOffset(0.2, 0.2),
//                    stops: [0.0, 1.0],
//                    tileMode: TileMode.clamp),
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(0),
//                    bottomRight: Radius.circular(0))),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 130),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: Text(
                          'Welcome to Cupertino!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1,
                              fontSize: 28,
                              color: Colors.white),
                        )))
                      ],
                    ),
                  ),
                ),
//          Padding(padding: EdgeInsets.all(10)),
                OutlineButton(
                  splashColor: Colors.white,
                  onPressed: () {
                    signInWithGoogle().whenComplete(() =>
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return cards();
                        })));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.white),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage("assets/google_logo.png"),
                            height: 35.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Wrap(
                        children: <Widget>[
                          Text(
                              'This is an app that helps you get more involved with your community, It allows you to '
                              'be updated with your community at all times and invovle yourself with all the events'
                              'in your community.'
                              ''
                              ' It awards points for the number of events you participate in and as you earn more points'
                                  'you can hopefully use them to get swag from your community',
                              style: TextStyle(
                                  height: 1, color: Colors.white, fontSize: 20))
                        ],
                      ),
                    )),
              ]))),
    );
  }
}


















int x = 0;







class cards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        "Events": (BuildContext context) => new Events(),
        "Voting": (BuildContext context) => new Voting(),
        "Safety": (BuildContext context) => new Safety(),
        "Resources": (BuildContext context) => new Resources(),
      },
    );

  }

  void setX(int val){
    x = val;
  }

  int getX(){
    return x;
  }

}

Color lightBlueIsh = Color(0xFF07489C);
Color lightGreen = Color(0xFF33BBB5);

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new homescreen();
}

class homescreen extends State<StatefulWidget> {





  @override
  Widget build(BuildContext context) {
//    FirebaseUser user = _auth.currentUser() as FirebaseUser;
      print(user1.displayName);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Your Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Events'),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Events()))
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bike),
              title: Text('Safe Routes'),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Safety()))
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Voting'),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Voting()))
              },
            ),
//            ListTile(
//              leading: Icon(Icons.remove_red_eye),
//              title: Text('Stored Equations'),
//              onTap: () => {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => ()))
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.edit),
//              title: Text('Log an Equations'),
//              onTap: () => {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => LogAnEquation()))
//              },
//            ),
          ],
        ),
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
                          'Welcome Bob Lee',
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
                  height: 600,
                  margin: EdgeInsets.only(top: 200),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(0)),
                      Container(

                        child: Row(
                          children: <Widget>[
                            Text(
                              'Your Points: 90',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),

                            ),

                          ],
                        )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            "Explore Your Community",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        height: 450,
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


  List<String> Categories = [
    "Safety",
    "Events",
    "Voting",

    "Resources"
  ];

  Map jobIcon = {
    "Safety": Icon(
      Icons.directions_bike,
      color: Color(0xFF083663),
      size: 50,
    ),
    "Events": Icon(Icons.calendar_today, color: Color(0xFF083663), size: 50),
    "Voting": Icon(Icons.account_balance, color: Color(0xFF083663), size: 50),
    "Resources": Icon(Icons.info, color: Color(0xFF083663), size: 50),
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
              onPressed: () {
                Navigator.of(context).pushNamed(categoryName);
              },
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
}
