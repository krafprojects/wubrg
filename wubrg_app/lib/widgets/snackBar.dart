import 'package:flutter/material.dart';

class SnackBar extends StatefulWidget {
  const SnackBar({super.key});

  @override
  State<SnackBar> createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBar> {
  @override
  Widget build(BuildContext context) {

  //   void showInSnackBar(String value) {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //         value,
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 16.0,
  //             fontFamily: "WorkSansSemiBold"),
  //       ),
  //       backgroundColor: Colors.blue,
  //       duration: const Duration(seconds: 3),
  //     ),
  //   );
  // }

    return const Scaffold();
  }
}

