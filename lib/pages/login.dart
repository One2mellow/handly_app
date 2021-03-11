import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 28.0
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Icon(
                FontAwesomeIcons.handsHelping,
                color: Colors.indigo[900],
                size: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(''
                      'Hand',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comforta',
                      color: Colors.indigo[900],
                    ),
                  ),
                  Text(''
                      'ly',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comforta',
                      color: Colors.deepPurple[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                  'Help the community to help each other',
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Comforta',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 120,),
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
              ), //Sign Up
              SizedBox(height: 12,),
              Text(
                'ALREADY REGISTERED? SIGN IN',
                style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(88, 204, 245, 1.0),
                Color.fromRGBO(120, 127, 246, 1.0),
              ],
            ),
          ),
        ), //Sign in Facebook
      ),
    );
  }
}
