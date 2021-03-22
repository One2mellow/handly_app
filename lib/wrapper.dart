import 'package:flutter/material.dart';
import 'package:handly_app/pages/home/home.dart';
import 'package:handly_app/pages/login/login.dart';
import 'package:handly_app/pages/user/update_user_profile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or login widget
    if (user == null) {
      return Login();
    } else if (user.phoneNumber == null || user.displayName == null) {
      return UpdateUserProfile();
    } else {
      return Home();
    }
    }
}
