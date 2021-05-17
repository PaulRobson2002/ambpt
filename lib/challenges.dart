import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:core';
import 'globals.dart' as globals;

class chalSelect extends StatefulWidget {
  @override
  _chalSelectState createState() => _chalSelectState();
}

class _chalSelectState extends State<chalSelect> {
  completeChalance(index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        title: Text(
          ("Challenges"),
          style: GoogleFonts.roboto(
            fontStyle: FontStyle.normal,
            fontSize: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: new ListView.builder(
                itemCount: globals.challenge.Work.length,
                itemBuilder: (BuildContext ctxt, int _index) {
                  //print(_index);
                  //print(globals.account.Users[_index].name);
                  return new FlatButton(
                    onPressed: () => {
                      globals.challenge.completeChallenge(_index),
                      for (var i = 0; i < globals.challenge.Work.length; i++)
                        {
                          if (globals.challenge.Work[i].complete)
                            {
                              globals.challenge.Work.removeAt(i),
                            }
                        },
                      setState(() {})
                    },

                    //globals.account.SelectedAccount = _index,
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserPage(),
                        ),
                      )*/

                    child: CardWidget(_index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CardWidget(int index) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Container(
        margin: const EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
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
                                  globals.challenge.Work[index].task +
                                      " x" +
                                      globals.challenge.Work[index].amount
                                          .toString(), //Name.toString(),
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
                                    "", //Age.toString(),
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
