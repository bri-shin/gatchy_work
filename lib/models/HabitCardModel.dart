import 'package:flutter/material.dart';

class HabitCardModel {
  String habitTitle;
  IconData icon;
  int streak;
  double moneyEarned;

  HabitCardModel(this.habitTitle, this.icon, this.streak, this.moneyEarned);
}