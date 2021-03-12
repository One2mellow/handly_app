import 'package:flutter/material.dart';
import 'package:handly_app/pages/home.dart';
import 'package:handly_app/pages/login/login.dart';
import 'package:provider/provider.dart';
import 'package:handly_app/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<NewUser>(context);

    //return either home or login widget
    if (user == null) {
      return Login();
    } else {
      return Home();
    }
    }
}