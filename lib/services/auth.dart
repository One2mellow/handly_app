import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:handly_app/models/user.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;





  //auth change user stream
  Stream <User> get user {
    return _auth.authStateChanges();
  }


  //user profile
 /* UserProfile profile (User user) {
    return user != null ? UserProfile(name: user.displayName, email: user.email, anon: user.isAnonymous, uid: user.uid) : null;
  }
*/
  //sign in with google
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential); // Once signed in, return the UserCredential
    User user = result.user;

    return result;
  }

  //sign in with facebook
  Future signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final  result = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.token);

      // Once signed in, return the UserCredential
      UserCredential res = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      User user = res.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  //sign in with twitter


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
