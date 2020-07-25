import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFF083663),
      appBar: AppBar(
        backgroundColor: Color(0xFF07489C),
        title: Text('Voting Information'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              CupertinoButton(
                child: Text(
                  "Why Vote?",

                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.green,
                onPressed: () =>
                {
//
                  showAlertDialog(context)
                },
              ),
              new CupertinoButton(

                  child: Text('Sample Ballot',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  onPressed: () => {_launchURL()}),

              new Text(
                "Which positions are you voting for this Election?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),

              Padding(padding: EdgeInsets.all(10)),

              new Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                      children: [

                        Text('Party'),
                        Text('Republican'),
                        Text('Democrat'),
                        Text('Peace and Freedom'),
                        Text('Libertarian'),
                        Text('Green'),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text('President'),
                        Text('Donald J Trump'),
                        Text('Joe Biden'),
                        Text('Gloria La Riva'),
                        Text('Jo Jorgensen'),
                        Text('Howie Hawkins')
                      ]
                  ),
                  TableRow(
                      children: [
                        Text('Vice President'),
                        Text('Mike R Pence'),
                        Text('--'),
                        Text('VP Candidate'),
                        Text('Other Candidate'),
                        Text('Hawkins Howie')
                      ]
                  ),
                  TableRow(
                      children: [
                        Text('Senator'),
                        Text('Kamala Harris'),
                        Text('Alexandria Ocasia Cortez')
                      ]
                  )
                ],
              ),
              new Text(
                "Which Propositions are you voting for?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),

              new CupertinoButton(
                color: Colors.green,
                child: Text("Link to Propositions information"),
                onPressed: () =>
                {
                  launching()
                },
              ),
              new CupertinoButton(
                color: Colors.green,
                child: Text("Link to Candidate Information"),
                onPressed: () =>
                {
                  launching2()
                },
              )

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
                        style: TextStyle(
                            fontSize: 18, fontStyle: FontStyle.italic),
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
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                      Text(
                          "Elections are decided by the people who go out and vote. Take some time and learn about the measures and the candidates. If you don’t vote, someone else will make the decision for you. Your power is in your vote.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      Text("3. It's your money",
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                      Text(
                          "You pay taxes, but do you know how that money is being used? Most people don’t. Voting is your chance to choose how your tax dollars are spent – such as funding for health care and social services. ",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      Text("4. Voting is an opportunity for change.",
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                      Text(
                          "Do you want to make a positive impact? Voting gives you that chance! Support the candidates and ballot measures that can help your community, state, and even the nation for the greater good. Make your voice heard in these elections. ",
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

    _
  }


  launching() async {
    const url =
        'google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launching2() async {
    const url =
        'https://2020election.procon.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
