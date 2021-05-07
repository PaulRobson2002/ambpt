import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:core';
import 'globals.dart' as globals;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.person_add),
              tooltip: 'Show Snackbar',
              onPressed: _GetName,
            ),
          ),
        ],
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
            Flexible(
              child: new ListView.builder(
                itemCount: globals.account.Users.length,
                itemBuilder: (BuildContext ctxt, int _index) {
                  print(globals.account.Users[_index]);
                  return CardWidget(
                    Age: globals.account.Users[_index].Age,
                    Name: globals.account.Users[_index].name,
                    current: globals.account.Users[_index].CurrWeight,
                    goal: globals.account.Users[_index].TargetWeight,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget CardWidget(
      {@required String Name,
      @required double Age,
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
                                  Name.toString(),
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

  _GetName() async {
    String Name;
    double Age, CurrWeight, TargetWeight;
    return await showDialog(
      context: context,
      builder: (context) {
        bool isChecked = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        onSaved: (var val) {
                          Name = val;
                        },
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Name";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Your Name"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (var val) {
                          Age = double.parse(val);
                        },
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Your age";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Your Age"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (var val) {
                          CurrWeight = double.parse(val);
                        },
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Your weight";
                        },
                        decoration: InputDecoration(
                            hintText: "Please Enter Your weight"),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (var val) {
                          TargetWeight = double.parse(val);
                        },
                        validator: (value) {
                          return value.isNotEmpty
                              ? null
                              : "Enter Target weight";
                        },
                        decoration: InputDecoration(
                            hintText: "Please Enter Your Target weight"),
                      ),
                    ],
                  )),
              title: Text('User Creation'),
              actions: <Widget>[
                InkWell(
                  child: Text('Submit   '),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      //print(globals.Users);//Debug

                      globals.account.Users.add(
                        //adds instance of an account to users list
                        new globals.account(
                          // passes in values and makes class
                          PAge: Age,
                          PName: Name,
                          PCurrweight: CurrWeight,
                          PTargetWeight: TargetWeight,
                        ),
                      );
                      //print(globals.Users);//Debug
                      setState(() {}); // refresh Pages
                      Navigator.of(context).pop(); // Close the dialog box
                      
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
