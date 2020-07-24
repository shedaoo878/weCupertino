import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Voting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Elections',
      home: votingScreen(),
    );
  }
}

class votingScreen extends StatefulWidget{
  @override
  votingState createState() => votingState();
}

class votingState extends State<votingScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voting'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              new CupertinoButton(
                  child: Text('Sample Ballot'),
                  onPressed: () => {
                    LogicalKeyboardKey.launchInternetBrowser
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'http://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}