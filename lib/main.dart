import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handly_app/pages/home.dart';
import 'package:handly_app/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login(),
    },
  ));
}