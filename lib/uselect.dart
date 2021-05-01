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
          style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[CardWidget(), CardWidget(), CardWidget()],
        ),
      ),
    );
  }

  Widget CardWidget() {
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
                      child: Column(
                        children: [
                          Text(
                            "Name",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            "Age",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
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
