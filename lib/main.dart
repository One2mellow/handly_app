import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handly_app/pages/home.dart';
import 'package:handly_app/pages/login/choose_account_widget.dart';
import 'package:handly_app/pages/login/create_account.dart';
import 'package:handly_app/pages/login/login.dart';
import 'package:handly_app/pages/login/sign_in.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login(),
      '/create_account': (context) => CreateNewAccount(),
      '/sign_in': (context) => SignIn(),
      '/choose_account': (context) => ChooseAccount(),
    },
  ));
}