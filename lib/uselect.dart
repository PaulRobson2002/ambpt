import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        title: Text(
          ("User Select"),
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
            CardWidget(Age: 18, Name: "Paul", current: 118.5, goal: 100.0),
          ],
        ),
      ),
    );
  }

  Widget CardWidget(
      {@required String Name,
      @required int Age,
      @required double goal,
      @required double current}) {
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
                padding: EdgeInsets.only(left: 7.5),
                child: Image(
                  image: AssetImage("asset/images/placeholder.png"),
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
              ),
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
                                  Name,
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
                                    Age.toString(),
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
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  current.toString() + "KG",
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
                                    goal.toString() + "KG",
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