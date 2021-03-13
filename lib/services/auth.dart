import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  NewUser _userFromFirebaseUser(User user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }


  //auth change user stream
  Stream <User> get user {
    return _auth.authStateChanges();
  }

  //sign in anon
  Future signInAnon() async {

    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  //sign in with email & password
  Future signInWithEmailAndPassword (String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //register with email & password
  Future registerWithEmailAndPassword (String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //reset password

}
