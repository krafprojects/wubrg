
import 'package:flutter/material.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart =  Color.fromARGB(255, 17, 112, 138);
  static const Color loginGradientEnd =  Color.fromARGB(255, 3, 138, 84);

  static const primaryGradient =  LinearGradient(
    colors:  [loginGradientStart, loginGradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}