library ambpt.globals;

import 'package:ambpt/main.dart';
import 'package:flutter/cupertino.dart';

class account {
  String name;
  double Age, TargetWeight, CurrWeight;
  List Challenges;

  static bool isLoggedIn = false;
  static String FName, SName, Pass, Email, Uname;
  static List<account> Users = [];

  account(
      {String PName, double PAge, double PTargetWeight, double PCurrweight}) {
    this.name = PName;
    this.Age = PAge;
    this.CurrWeight = PCurrweight;
    this.TargetWeight = PTargetWeight;
  }
  static bool confirmPass(Value) {
    if (Value == Pass) {
      return true;
    } else {
      return false;
    }
  }
}

class challenge {}
