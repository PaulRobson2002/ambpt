import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String Email, Pass;

  const SecondScreen({Key key, this.Email, this.Pass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),
          appBar: AppBar(
            title: Text('Login Page'),
          ),
        ));
  }
}
