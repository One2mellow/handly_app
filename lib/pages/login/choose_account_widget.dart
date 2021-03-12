import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/pages/home.dart';
import 'package:handly_app/pages/login/login.dart';

class ChooseAccount extends StatelessWidget {

  final Function goToSignUp;
  final Function goToSignIn;

  ChooseAccount({this.goToSignUp, this.goToSignIn});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ), //Sign in Facebook
        SizedBox(height: 20,),
        Container(
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
        SizedBox(height: 20,),
        Container(
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
        ), //Sign in Google
        SizedBox(height: 20,),
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
            onTap: () {
              Navigator.pushNamed(context, '/create_account');
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
          onTap: () {},
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
      ],
    );
  }
}
