import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/pages/login/choose_account_widget.dart';
import 'package:handly_app/pages/login/create_account.dart';
import 'package:handly_app/pages/login/sign_in.dart';



class Login extends StatelessWidget {

  PageController pageController = PageController();

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
              SizedBox(height: 100,),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    ChooseAccount(
                      goToSignIn: () {
                        pageController.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      },
                      goToSignUp: () {
                        pageController.animateToPage(2, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                      },
                    ),
                    SignIn(
                      goToSignUp: () {
                        pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      },
                      goToHome: () {
                        pageController.animateToPage(0, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      },
                    ),
                    CreateNewAccount(
                      cancelBackToHome: () {
                        pageController.animateToPage(0, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      },
                    ),
                    ],
                ),
              ),
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


