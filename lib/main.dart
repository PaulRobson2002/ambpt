import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ambpt/UserSelect.dart';
import 'package:ambpt/register.dart';
import 'forgotpass.dart';
import 'globals.dart' as globals;

void main() => runApp(new Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String name, email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('asset/images/flutter-logo.png')),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => register()));
              },
              child: Text('New User? Create Account',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(color: Colors.white))))
        ]),
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
              name = val;
            },
          ),
        ),
        new SizedBox(height: 15.0),
        new Padding(
        padding: EdgeInsets.symmetric( vertical: 7.5),
        child:
        new FlatButton(
          onPressed: () {
            //ForgotPass
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgotPass()));
            //TODO FORGOT PASSWORD SCREEN GOES HERE
          },
          child: Text(
            'Forgot Password',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: Colors.blue, fontSize: 15)),
          ),
        ),),
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
              'Login',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          ),
        ),
      ],
    );
  }

  String validateName(String value) {
    print(globals.Pass);
    print(value);
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (value != globals.Pass) {
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
    } else if ((!regExp.hasMatch(value)) | (value != globals.Email)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondScreen()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
