import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                //itemCount: globals.Users.length,
                itemCount: 1,
                itemBuilder: (BuildContext ctxt, int _index) {
                  return CardWidget(
                      Age: 19, Name: "Test", current: 198.0, goal: 100.0);
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

  _GetName() async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Name";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Your Name"),
                      ),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Your age";
                          
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Your Age"),
                      ),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value.isNotEmpty ? null : "Enter Your weight";
                        },
                        decoration: InputDecoration(
                            hintText: "Please Enter Your weight"),
                      ),
                      TextFormField(
                        controller: _textEditingController,
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
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  String validateEmail(String value) {
    print(value);
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if ((!regExp.hasMatch(value)) | (value != globals.Email)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
