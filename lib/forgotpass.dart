import 'main.dart'; // Main Page
import 'package:flutter/material.dart'; // Flutter
import 'globals.dart'; // GLobal Variables
import 'package:google_fonts/google_fonts.dart';



class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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
    );
  }
}