library ambpt.globals;

import 'dart:math';

import 'package:ambpt/main.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

Random random = new Random();

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
  static List Workouts = [
    "Pushups",
    "Squats",
    "Burpee",
  ];
  static int amount, taskcompleted;
  bool completed;
  static List<exercise> Work = [];
  challenge(amount, completed, taskcompleted) {
    challenge.amount = amount;
    this.completed = completed;
    challenge.taskcompleted = taskcompleted;
  }

  static generateChallenges() {
    for (var i = 0; i < challenge.amount; i++) {
      int randomNumber = random.nextInt(Workouts.length);
      int randomAmount = random.nextInt(60) + 5;
      //print(Workouts[randomNumber]);
      challenge.Work.add(
        new exercise(
          randomAmount,
          false,
          Workouts[randomNumber],
        ),
      );
    }
  }

  static completeChallenge(index) {
    Work[index].complete = !Work[index].complete;
  }
}

class exercise {
  int amount;
  bool complete;
  String task;
  exercise(int amount, bool complete, String task) {
    this.amount = amount;
    this.complete = complete;
    this.task = task;
  }
}
