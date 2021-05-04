library ambpt.globals;

import 'package:ambpt/main.dart';
import 'package:flutter/cupertino.dart';

bool isLoggedIn = false;
String FName, SName, Pass, Email, Uname;
List<account> Users = [];

class account {
  String name;
  double Age, TargetWeight, CurrWeight;
  List Challenges;
  account(
      {String PName, double PAge, double PTargetWeight, double PCurrweight}) {
    this.name = PName;
    this.Age = PAge;
    this.CurrWeight = PCurrweight;
    this.TargetWeight = PTargetWeight;
  }
}

class challenge {}
