
import 'package:flutter/material.dart';

class Colors {

  const Colors();

  static const Color loginGradientStart =  Color.fromARGB(255, 102, 251, 229);
  static const Color loginGradientEnd =  Color.fromARGB(255, 3, 156, 95);

  static const primaryGradient =  LinearGradient(
    colors:  [loginGradientStart, loginGradientEnd],
    stops:  [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}