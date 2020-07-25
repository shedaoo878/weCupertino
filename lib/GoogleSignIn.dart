import 'package:cupertino_pride/cards.dart';
import 'package:cupertino_pride/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
                    signInWithGoogle().whenComplete(() => Navigator.push(context,
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
                            'This is an app description, It will contain all the information about the app that is '
                            'neccessary I am typing all of this extra info to make sure that the text wraps properly'
                            'I do not know how much more I need',
                            style:
                              TextStyle(
                                  height: 1,
                                  color: Colors.white,
                                  fontSize: 20
                              )
                          )
                        ],
                      ),
                    )),
              ]))),
    );
  }
}

class WelcomeUserWidget extends StatelessWidget {

  GoogleSignIn _googleSignIn;
  FirebaseUser _user;
  WelcomeUserWidget(FirebaseUser user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }
  @override
  Widget build(BuildContext context) {
    ClipOval(
        child: Image.network(
            _user.photoUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover
        )
    );

    Text(_user.displayName,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25));


    FlatButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20)),
    onPressed: () {
    _googleSignIn.signOut();
    Navigator.pop(context);
    }
    );
  }
  }