import 'main.dart'; // Main Page
import 'package:flutter/material.dart'; // Flutter
import 'globals.dart' as globals; // GLobal Variables
import 'package:google_fonts/google_fonts.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool valid = false;
  String ConfirmPass, Password, email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: Form(
                    key: _key,
                    autovalidate: _validate,
                    child: FormUI(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: new TextFormField(
              decoration: new InputDecoration(
                hintText: 'Email Address',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (String val) {
                email = val;
              }),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validateName,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              Password = val;
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Confirm Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validateName,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              ConfirmPass = val;
            },
          ),
        ),
        new SizedBox(height: 15.0),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: _sendToServer,

            /*() {
              _sendToServer
              //Navigator.push(
              //context, MaterialPageRoute(builder: (_) => HomePage()));
            },*/
            child: Text(
              'Reset Password',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          ),
        ),
      ],
    );
  }

  String validateName(String value) {
    print(value);
    print(globals.account.Pass);
    print(value);
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (value != globals.account.Pass) {
      return "Invalid Password";
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if ((!regExp.hasMatch(value)) | (value != globals.account.Email)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      if (Password == ConfirmPass) {
        valid = true;
        globals.account.Pass == Password;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      }
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
