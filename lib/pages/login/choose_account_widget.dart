import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/pages/home/home.dart';
import 'package:handly_app/pages/shared/loading.dart';
import 'package:handly_app/services/auth.dart';

class ChooseAccount extends StatefulWidget {

  final Function goToSignUp;
  final Function goToSignIn;

  ChooseAccount({this.goToSignUp, this.goToSignIn});

  @override
  _ChooseAccountState createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  final AuthService _auth = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: InkWell(
            onTap: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInWithFacebook();
              if (result == null) {
                setState(() => loading = true);
                print('Unable to Sign In');
              } else {
                print('Sign in');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.facebookF,
                  size: 30.0,
                ),
                Text(
                  ' |  Sign in with Facebook',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ), //Sign in Facebook
        SizedBox(height: 20,),
        /*Container(
          padding: EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.twitter,
                size: 30.0,
              ),
              Text(
                ' |  Sign in with Twitter',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ), //Sign in Twitter
        SizedBox(height: 20,),*/ //twitter button
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: InkWell(
            onTap: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInWithGoogle();
              if (result == null) {
                setState(() => loading = false);
                print('Unable to Sign In');
              } else {
                print('Sign in');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  size: 30.0,
                ),
                Text(
                  ' |  Sign in with Google',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ), //Sign in Google
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.68),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: InkWell(
            onTap: () {
              widget.goToSignUp();
              },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ), //Sign Up
        SizedBox(height: 12,),
        InkWell(
          onTap: () {
            widget.goToSignIn();
          },
          child: Text(
            'ALREADY REGISTERED? SIGN IN',
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 160,),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: InkWell(
            onTap: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                setState(() => loading = false);
                print('Unable to Sign In');
              } else {
                print('Sign in');
                print(result);

              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.fly,
                  size: 30.0,
                ),
                Text(
                  ' |  Sign in as Guest',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ), //Sign in as guest
      ],
    );
  }
}
