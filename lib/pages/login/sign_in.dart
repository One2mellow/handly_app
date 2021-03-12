import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'SIGN IN ',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Comforta',
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Username',
              hintStyle: TextStyle(
                color: Colors.white70.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
            ),
          ),  //Username
          SizedBox(height: 13,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.white70.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 5,),//Password
          Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _rememberPassword,
                onChanged: (newValue) {
                  setState(() {
                    _rememberPassword = newValue;
                  });
                },
                activeColor: Colors.deepPurple[600],
              ),
              Text(
                'Remember Password',
                style: TextStyle(
                  fontFamily: 'Comforta',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[600],
                ),
              ),
            ],
          ),  //CheckBox
          SizedBox(height: 80,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              'LOG IN',
              style: TextStyle(
                color: Color.fromRGBO(120, 127, 246, 1.0),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Text(
              'Don\'t Have an Account? SIGN UP'
            ),
          )
        ],
      ),
    );
  }
}
