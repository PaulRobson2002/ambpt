import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:core';
import 'globals.dart' as globals;

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
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.1,
                foregroundDecoration: BoxDecoration(
                  //color: Colors.blue,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(7.5),
                  ),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.25,
                        left: 25,
                      ),
                      child: Text(
                        "Your Progress",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              padding: EdgeInsets.only(top: 60),
            ),
            Padding(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.blue,
                foregroundDecoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(7.5),
                  ),
                  border: Border.all(
                    color: Colors.white,
                  ),
                  //color: Colors.white,
                ),
                child: FlatButton(
                  onPressed: () => print("Pressed"),
                  textColor: Colors.white,
                  //color: Colors.blue,
                  child: Text(
                    "Challenges",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 100),
            ),
          ],
        ),
      ),
    );
  }
}
