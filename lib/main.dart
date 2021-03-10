import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handly_app/pages/home.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    routes: {
      '/home': (context) => Home(),
    },
  ));
}