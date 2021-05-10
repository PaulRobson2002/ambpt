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
              child: Text(
                "Welcome " +
                    globals.account.Users[globals.account.SelectedAccount].name,
              ),
              padding: EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
