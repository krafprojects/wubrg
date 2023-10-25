
import 'package:flutter/material.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart =  Color.fromARGB(222, 42, 103, 58);

  static const Color loginGradientEnd =  Color.fromARGB(255, 43, 59, 80);

  static const primaryGradient =  LinearGradient(
    colors:  [loginGradientStart,loginGradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}