import 'package:flutter/material.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {

  bool _termsAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Create Account',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 24,
              fontWeight: FontWeight.w200,
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
          ),  //Password
          SizedBox(height: 13,),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle: TextStyle(
                color: Colors.white70.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
            ),
          ),  //Confirm Password
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: _termsAgreed,
                  onChanged: (newValue) {
                    setState(() {
                      _termsAgreed = newValue;
                    });
                  },
                activeColor: Colors.deepPurple[600],
              ),
              Text(
                  'Agreed to Terms & Conditions',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'CANCEL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Comforta',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 40.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Color.fromRGBO(120, 127, 246, 1.0),
                    fontSize: 20,
                    fontFamily: 'Comforta',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
