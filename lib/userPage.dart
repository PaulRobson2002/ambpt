import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'challenges.dart';
import 'dart:core';
import 'dart:math';
import 'globals.dart' as globals;

Random random = new Random();

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.article,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ),
        ],
        title: Text(
            globals.account.Users[globals.account.SelectedAccount].name +
                "'s Profile"),
      ),
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("asset/images/placeholder.png"),
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  Text(
                    "Welcome " +
                        globals.account.Users[globals.account.SelectedAccount]
                            .name,
                    style: GoogleFonts.roboto(
                      fontStyle: FontStyle.normal,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.075,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
            ),
            CardWidget(),
            Padding(
              child: Container(
                margin:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.white,
                /*foregroundDecoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(7.5),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  //color: Colors.white,
                ),*/
                child: FlatButton(
                  onPressed: () {
                    int randomNumber = random.nextInt(10) + 1;
                    if (globals.challenge.Work.length == 0) {
                      new globals.challenge(randomNumber, false, 0);
                      globals.challenge.generateChallenges();
                    }
                    //chalSelect
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => chalSelect(),
                      ),
                    );
                    //print(globals.challenge.Work[0].task);
                  },
                  textColor: Colors.black,
                  //color: Colors.blue,
                  child: Text(
                    "Challenges",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardWidget({
    @required String Name,
    @required double Age,
    @required double goal,
    @required double current,
  }) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Container(
        margin: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
        //padding: const EdgeInsets.fromLTRB(20, 20.0, 20.0, 0),
        child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Progress",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Current Weight:" +
                                        globals
                                            .account
                                            .Users[
                                                globals.account.SelectedAccount]
                                            .CurrWeight
                                            .toString(),
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Target Weight: " +
                                        globals
                                            .account
                                            .Users[
                                                globals.account.SelectedAccount]
                                            .TargetWeight
                                            .toString(),
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
