import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:handly_app/pages/shared/loading.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:handly_app/services/get_location.dart';
import 'package:handly_app/services/handly_calls.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:location/location.dart';


class UpdateUserProfile extends StatefulWidget {
  @override
  _UpdateUserProfileState createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {


  final FirebaseAuth _ath = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _val = true;
  String phoneNumber = '', firstName = '', lastName = '', smsVerify, verificationId;

  @override

  Widget build(BuildContext context) {


    Future<void> verfiyPhone() async{
      final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
        this.verificationId = verId;
      };

      final PhoneCodeSent smsCodeSent= (String verId, [int forceCodeResent]) {
        this.verificationId = verId;
      };

      final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth){};
      final PhoneVerificationFailed verifyFailed= (e){
        print('${e.message}');
      };
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted : verifiedSuccess,
        verificationFailed: verifyFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve,

      );

    }


    if (loading) {
      return Loading();
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(FontAwesomeIcons.userAstronaut),
            centerTitle: true,
            elevation: 0,
            title: Text(
              'My Profile',
            ),
          ),
          body: Form(
            key: formKey,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(88, 204, 245, 1.0),
                    Color.fromRGBO(120, 127, 246, 1.0),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 5),
                child: ListView(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val) {
                        setState(() => firstName = val);
                      },
                      validator: (val) {
                        if (val.isEmpty)  {
                          return 'Please Enter Your First Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                          color: Colors.white70.withOpacity(0.5),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                      ),
                    ), //First Name
                    SizedBox(height: 13.0,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val) {
                        setState(() => lastName = val);
                      },
                      validator: (val) {
                        if (val.isEmpty)  {
                          return 'Please Enter Your Last Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                          color: Colors.white70.withOpacity(0.5),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                      ),
                    ), //Last Name
                    SizedBox(height: 13,),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (val) {
                              setState(() => phoneNumber = val);
                            },
                            validator: (val) {
                              if (val.isEmpty)  {
                                return 'Your phone number is needed so people can reach out to you';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                color: Colors.white70.withOpacity(0.5),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              tooltip: 'Verify',
                              icon: Icon(Icons.verified_outlined),
                              onPressed: () async {
                                verfiyPhone();
                                showModalBottomSheet(context: context, builder: (BuildContext context) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: "Enter your phone number",
                                          ),
                                          onChanged: (value){
                                            phoneNumber = value;
                                            },
                                        ),
                                        TextButton(
                                            onPressed: () async {
                                              final AuthCredential credential = PhoneAuthProvider.credential(
                                                verificationId: verificationId,
                                                smsCode: smsVerify,);

                                              await _ath.currentUser.updatePhoneNumber(credential);
                                              await _ath.currentUser.updateProfile(displayName:'$firstName $lastName');
                                              Navigator.pop(context);
                                            },
                                            child: Text('submit!'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                );
                              },
                            ),
                            Text(
                                'Verify',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ), //phone number
                    SizedBox(height: 13,),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      child: _val ? Container() : null, //type,
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.indigo),
                            )
                        ),
                      ),
                      onPressed: () async {
                        if(formKey.currentState.validate()) {

                          final AuthCredential credential = PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: smsVerify,);

                          await _ath.currentUser.updatePhoneNumber(credential);
                          await _ath.currentUser.updateProfile(displayName:'$firstName $lastName');
                          Navigator.pop(context);
                        } else {
                          print(Error);
                        }
                      },
                      child: Text('SUBMIT'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}




