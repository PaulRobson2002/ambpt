import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ambpt/main.dart';
import 'globals.dart' as globals;

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool _validate = false;
  String fname, email, username, password, sname;
  double CurrWeight, TargetWeight, Age;

  GlobalKey<FormState> _key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      appBar: AppBar(
        title: Text(
          'Register Page',
          style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  'Create Account',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            decoration: new InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validateUsername,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              username = val;
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            decoration: new InputDecoration(
              hintText: 'First Name',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validateName,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              fname = val;
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            decoration: new InputDecoration(
              hintText: 'Surname',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validateName,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              sname = val;
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validatePassword,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              password = val;
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Age',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: ValidateAge,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              Age = double.parse(val);
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Current Weight',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: ValidateDouble,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              CurrWeight = double.parse(val);
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
          child: new TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              hintText: 'Target Waright',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: ValidateDouble,
            style: GoogleFonts.roboto(fontStyle: FontStyle.normal),
            onSaved: (String val) {
              TargetWeight = double.parse(val);
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
            onPressed: () {
              _sendToServer();
            },

            /*() {
              _sendToServer
              //Navigator.push(
              //context, MaterialPageRoute(builder: (_) => HomePage()));
            },*/
            child: Text(
              'Register',
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: Colors.white, fontSize: 25)),
            ),
          ),
        ),
      ],
    );
  }

  String ValidateAge(String value) {
    String pattern = r'^[0-9]*$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Value is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Value";
    }
    return null;
  }

  String ValidateDouble(String value) {
    String pattern = r'^[0-9][\.\d]*(,\d+)?$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Value is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Value";
    }
    return null;
  }

  String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Password";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validateUsername(String value) {
    String pattern = r'^.{3,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Username is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Username";
    } else {
      return null;
    }
  }

  String validateName(String value) {
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print(
          fname + " " + email + " " + username + " " + password + " " + sname);

      globals.account.Email = email;
      globals.account.Uname = username;
      globals.account.FName = fname;
      globals.account.SName = sname;
      globals.account.Pass = password;

      globals.account.Users.add(
        //adds instance of an account to users list

        new globals.account(
          // passes in values and makes class
          PAge: Age,
          PName: fname+" " + sname,
          PCurrweight: CurrWeight,
          PTargetWeight: TargetWeight,
        ),
      );
    
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
