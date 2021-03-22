import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handly_app/pages/shared/loading.dart';
import 'package:handly_app/services/auth.dart';

class CreateNewAccount extends StatefulWidget {

  final Function cancelBackToHome;

  CreateNewAccount({this.cancelBackToHome});


  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {

  final AuthService _auth = AuthService();

  String email = '', password = '', passwordConfirm = '', phoneNumber = '';
  bool _termsAgreed = false;
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  void createUser() {
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Form(
      key: formKey,
      child: Container(
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction ,
              onChanged: (textValue) {
                setState(() {
                  email = textValue;
                });
              },
              validator: (emailValue) {
                if (emailValue.isEmpty) {
                  return 'Please enter Email';
                }

                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                    "\\@" +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                    "(" +
                    "\\." +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                    ")+";
                RegExp regExp = new RegExp(p);

                if (regExp.hasMatch(emailValue)) {
                  // So, the email is valid
                  return null;
                }

                return 'This is not a valid email';
              },
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                hintStyle: TextStyle(
                  color: Colors.white70.withOpacity(0.5),
                ),
              ),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.0,
              ),
            ),  //Email
            SizedBox(height: 13,),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (textValue) {
                setState(() {
                  password = textValue;
                });
              },
              validator: (passwordValue) {
                if (passwordValue.isEmpty) {
                  return 'Please enter Password';
                }
                if (passwordValue.length < 8) {
                  return 'Password must be at least 8 charecters';
                }
                return null;
              },
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction ,
              onChanged: (textValue) {
                setState(() {
                  passwordConfirm = textValue;
                });
              },
              validator: (confirmValue) {
                if (confirmValue != password) {
                  return 'Password must match';
                }
                return null;
              },
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
                InkWell(
                  onTap: () {
                    widget.cancelBackToHome();
                  },
                  child: Text(
                      'CANCEL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Comforta',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: () async {
                    if(formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        AlertDialog(
                          title: Text('ERROR!'),
                          content: Text('Couldn\'t create Account with the given credentials'),
                        );
                      }
                    }
                  },
                  child: Container(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
