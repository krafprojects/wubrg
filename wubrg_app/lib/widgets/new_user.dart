import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wubrg_app/services/database_service.dart';
import 'package:wubrg_app/themes/theme.dart' as Theme;

class NewUser extends StatefulWidget {
  NewUser(
      this.context,
      this.myFocusNodeName,
      this.myFocusNodeEmail,
      this.myFocusNodePassword,
      this.signupNameController,
      this.signupEmailController,
      this.signupPasswordController,
      this.signupConfirmPasswordController,
      this.obscureTextSignup,
      this.obscureTextSignupConfirm,
      this.toggleSignup,
      this.toggleSignupConfirm,
      this.scaffoldKey,
      this.showInSnackBar,
      {super.key});

  final BuildContext context;
  final FocusNode myFocusNodeName;
  final FocusNode myFocusNodeEmail;
  final FocusNode myFocusNodePassword;
  TextEditingController signupNameController;
  TextEditingController signupEmailController;
  TextEditingController signupPasswordController;
  TextEditingController signupConfirmPasswordController;
  final bool obscureTextSignup;
  final bool obscureTextSignupConfirm;
  final void Function() toggleSignup;
  final void Function() toggleSignupConfirm;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function(String value) showInSnackBar;

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  late final StreamSubscription<AuthState> _authStateChangesSubscription;
  @override
  void initState() {
    super.initState();
    _authStateChangesSubscription = supabase.auth.onAuthStateChange.listen((event) {
      final session = event.session;
      if (session != null) {
        Navigator.of(context).pushNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    widget.myFocusNodeName.dispose();
    widget.myFocusNodeEmail.dispose();
    widget.myFocusNodePassword.dispose();
    widget.signupNameController.dispose();
    widget.signupEmailController.dispose();
    widget.signupPasswordController.dispose();
    widget.signupConfirmPasswordController.dispose();
    _authStateChangesSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            // overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          onSaved: (value) {
                            // checar en un futuro
                            widget.signupNameController =
                                value as TextEditingController;
                          },
                          focusNode: widget.myFocusNodeName,
                          controller: widget.signupNameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.black,
                            ),
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length <= 2 ||
                                value.length >= 20) {
                              return 'Please enter your name';
                            }
                            if (RegExp(r'\d').hasMatch(value)) {
                              return 'Name should not contain numbers';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          onSaved: (value) {
                            // checar en un futuro
                            widget.signupEmailController =
                                value as TextEditingController;
                          },
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                          focusNode: widget.myFocusNodeEmail,
                          controller: widget.signupEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must contain at least 6 characters ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // checar en un futuro
                            widget.signupPasswordController =
                                value as TextEditingController;
                          },
                          focusNode: widget.myFocusNodePassword,
                          controller: widget.signupPasswordController,
                          obscureText: widget.obscureTextSignup,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            suffixIcon: GestureDetector(
                              onTap: widget.toggleSignup,
                              child: Icon(
                                widget.obscureTextSignup
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value != widget.signupPasswordController.text) {
                              return 'The password does not match with the password above';
                            }
                            return null;
                          },

                          // controller: widget.signupConfirmPasswordController,
                          obscureText: widget.obscureTextSignupConfirm,
                          style: const TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              FontAwesomeIcons.lock,
                              color: Colors.black,
                            ),
                            hintText: "Confirmation",
                            hintStyle: const TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                            suffixIcon: GestureDetector(
                              onTap: widget.toggleSignupConfirm,
                              child: Icon(
                                widget.obscureTextSignupConfirm
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colores.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.Colores.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: [
                        Theme.Colores.loginGradientEnd,
                        Theme.Colores.loginGradientStart
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: Theme.Colores.loginGradientEnd,
                  onPressed: submit,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: "WorkSansBold"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void submit() async {
    try {
      await supabase.auth.signInWithOtp(
        email: widget.signupEmailController.text,
      );
      if (mounted) {
        widget.showInSnackBar('Check your email for the login link!');
      }
    } on AuthException catch (error) {
      widget.showInSnackBar(error.message);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Algo malio sal'),
      //   ),
      // );
    }

    // final response = await Supabase.instance.client.from('users').insert({
    //   'email_address': widget.signupEmailController.text,
    //   'name': widget.signupNameController.text,
    // });
    // if (response.error != null) {
    //   widget.showInSnackBar(response.error!.message);
    // } else {
    //   widget.showInSnackBar('User created!');
    // }
  }

  // void submit2()async {
  //   final AuthResponse res = await Supabase.auth.signUp(
  //     email: widget.signupEmailController.text ,
  //     password: 'example-password',
  //   );
  // }
}
