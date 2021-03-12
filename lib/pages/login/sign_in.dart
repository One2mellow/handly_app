import 'package:flutter/material.dart';
import 'package:handly_app/pages/shared/loading.dart';
import 'package:handly_app/services/auth.dart';


class SignIn extends StatefulWidget {

  final Function goToSignUp;
  final Function goToHome;
  SignIn({this.goToSignUp, this.goToHome});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _rememberPassword = false;
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Stack(
      children: [
        BackButton(
          color: Colors.indigo,
          onPressed: () {
            widget.goToHome();
          },
        ),
        Form(
          key: formKey,
          child: Container(
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
                SizedBox(height: 5,),
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
                InkWell(
                  onTap: () async {
                    if(formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => loading = false);
                        AlertDialog(
                          title: Text('ERROR!'),
                          content: Text('Couldn\'t sign in with the given credentials'),
                        );
                      }
                    }
                  },
                  child: Container(
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
                  child: InkWell(
                    onTap: () {
                      widget.goToSignUp();
                    },
                    child: Text(
                        'Don\'t Have an Account? SIGN UP'
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
