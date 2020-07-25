import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class Voting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upcoming Elections',
      home: votingScreen(),
    );
  }
}

class votingScreen extends StatefulWidget {
  @override
  votingState createState() => votingState();
}

class votingState extends State<votingScreen> {
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
              CupertinoButton(
                child: Text(
                  "Why Should You Vote?",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () => {
//
                  showAlertDialog(context)
                },
              ),
              new CupertinoButton(
                  child: Text('Sample Ballot'),
                  onPressed: () => {_launchURL()}),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,

        child: SizedBox(
        width: 4000,
          child: Expanded(
              child:
          CupertinoAlertDialog(

          title: Text(
            "Why Should You Vote?",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: <Widget>[
              Text(
                "1. Elections have consequences.",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              Text(
                  "You have the power to decide on the quality of life you want for yourself and future generations. Voting is your chance to stand up for the issues you care about like public transportation, raising minimum wage, or funding local schools. This is your life: take the time to help decide what’s best.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center),
              Padding(padding: EdgeInsets.only(bottom: 10),),
              Text("2. Not voting is giving up your voice.",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
              Text("Elections are decided by the people who go out and vote. Take some time and learn about the measures and the candidates. If you don’t vote, someone else will make the decision for you. Your power is in your vote.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center),
              Padding(padding: EdgeInsets.only(bottom: 10),),
              Text("3. It's your money",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
              Text("You pay taxes, but do you know how that money is being used? Most people don’t. Voting is your chance to choose how your tax dollars are spent – such as funding for health care and social services. ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center),
              Padding(padding: EdgeInsets.only(bottom: 10),),
              Text("4. Voting is an opportunity for change.",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
              Text("Do you want to make a positive impact? Voting gives you that chance! Support the candidates and ballot measures that can help your community, state, and even the nation for the greater good. Make your voice heard in these elections. ",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
//          actions: <Widget>[
//            CupertinoDialogAction(
//                isDefaultAction: true,
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//                child: Text("Close")),
//    ]
        ))));
  }

  _launchURL() async {
    const url =
        'https://eservices.sccgov.org/rov/docs/sampleballot/110/SCLA_110816_ES_BT135.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
