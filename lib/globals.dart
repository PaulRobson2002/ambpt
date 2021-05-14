library ambpt.globals;

import 'dart:math';

import 'package:ambpt/main.dart';
import 'package:flutter/cupertino.dart';

class account {
  String name;
  double Age, TargetWeight, CurrWeight;
  List Challenges;

  static bool isLoggedIn = false;
  static String FName, SName, Pass, Email, Uname;
  static List<account> Users = [];
  static int SelectedAccount;
  account(
      {String PName, double PAge, double PTargetWeight, double PCurrweight}) {
    this.name = PName;
    this.Age = PAge;
    this.CurrWeight = PCurrweight;
    this.TargetWeight = PTargetWeight;
  }
}

class challenge {
  int amount, completed, taskcompleted;
  static List<exercise> Exercises = [];
  challenge(amount, completed, taskcompleted) {
    this.amount = amount;
    this.completed = completed;
    this.taskcompleted = taskcompleted;
  }

  generateChallenges() {
    for (var i = 0; i < amount; i++) {
      Exercises.add(new exercise(2, 0, false, "Pushups"));
    }
  }
}

class exercise {
  int amount, completedamt;
  bool complete;
  String task;
  exercise(amount, completedamt, complete, task) {
    this.amount = amount;
    this.completedamt = completedamt;
    this.complete = complete;
    this.task = task;
  }
}
