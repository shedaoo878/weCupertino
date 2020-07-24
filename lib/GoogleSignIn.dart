import 'package:cupertino_pride/cards.dart';
import 'package:cupertino_pride/events.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Cupertino Pride'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(40),
            constraints: BoxConstraints.expand(height: 160),
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                    begin: const FractionalOffset(1.0, 1.0),
                    colors: [Colors.lightGreen, Colors.lightBlue],
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
                    'Welcome to Cupertino!',
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

            child: Wrap(

            ),
          ),
          RaisedButton.icon(
              onPressed: () {
                signInWithGoogle().whenComplete(() => Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return cards();
                    })));
              },
              icon: Icon(Icons.search),
              label: Text("Sign In homie"))
        ])

//        child: Center(
//          child: Column(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              FlutterLogo(),
//              RaisedButton.icon(
//                  onPressed: () {
////                    signInWithGoogle().whenComplete(() =>
//
////                  Navigator.pop(context)
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (BuildContext context) {
//                          return cards();
//                        }));
//                  },
//
//                  icon: Icon(Icons.search),
//                  label: Text("Sign In homie"))
//            ],
//          ),
//        ),
//      ),
            ));
  }
}
