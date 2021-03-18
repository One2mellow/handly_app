import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handly_app/pages/handly_calls/create_handly_call.dart';
import 'package:handly_app/pages/home/home.dart';
import 'package:handly_app/pages/login/choose_account_widget.dart';
import 'package:handly_app/pages/login/create_account.dart';
import 'package:handly_app/pages/login/login.dart';
import 'package:handly_app/pages/login/sign_in.dart';
import 'package:handly_app/services/auth.dart';
import 'package:handly_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HandlyApp());
}

class HandlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        // initialRoute: '/login',
        routes: {
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/create_account': (context) => CreateNewAccount(),
          '/sign_in': (context) => SignIn(),
          '/choose_account': (context) => ChooseAccount(),
          '/create_new_handly_call': (context) => CreateNewHandlyCall(),
        },
      ),
    );
  }
}
