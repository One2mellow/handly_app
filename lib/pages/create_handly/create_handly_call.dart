import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handly_app/pages/shared/loading.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:handly_app/services/handly_calls.dart';
import 'package:numberpicker/numberpicker.dart';

class CreateNewHandlyCall extends StatefulWidget {
  @override
  _CreateNewHandlyCallState createState() => _CreateNewHandlyCallState();
}

class _CreateNewHandlyCallState extends State<CreateNewHandlyCall> {


  final FirebaseAuth _ath = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _val = true;
  String title = '', type = '', reward = '', name = '', user = '', description = '';
  int money = 0, score = 0;
  var time;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loading();
    } else {
      return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: Text(
          'Post new Handly',
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) {
                    setState(() => title = val);
                  },
                  validator: (val) {
                    if (val.isEmpty)  {
                      return 'Please Enter a title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    hintStyle: TextStyle(
                      color: Colors.white70.withOpacity(0.5),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ), //Title
                SizedBox(height: 13.0,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 6,
                  onChanged: (val) {
                    setState(() => description = val);
                  },
                  validator: (val) {
                    if(val.isEmpty){
                      return 'Please Describe your Handly';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(
                      color: Colors.white70.withOpacity(0.5),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ), //description
                SizedBox(height: 13,),
                TextFormField(
                  maxLength: 12,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (val) {
                    setState(() => type = val);
                  },
                  validator: (val) {
                    if (val.isEmpty)  {
                      return 'what kind of help do you need?';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Type of help (School/Computer/Fix something at home etc.)',
                    hintStyle: TextStyle(
                      color: Colors.white70.withOpacity(0.5),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ), //type
                SizedBox(height: 13,),
                SwitchListTile(
                  title: Text(
                    'Would you pay for the help?',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Comforta',
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                    value: _val,
                    onChanged: (value){
                    if(_val == false) {
                      setState(() => money =0);
                    }
                      setState(() {
                        _val = value;
                      });
                    },
                    ),
                SizedBox(height: 10,),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                  child: _val ? Container(
                    decoration: BoxDecoration(
                      color: Color(0xC7D3D4ff),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0x603F83FF)),
                    ),
                    child: NumberPicker(
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                        minValue: 0,
                        maxValue: 1000,
                        step: 5,
                        axis: Axis.horizontal,
                        value: money,
                        onChanged: (amount) {
                          setState(() => money = amount);
                        },
                    ),
                  )
                   : TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    minLines: 2,
                    maxLines: 4,
                    onChanged: (val) {
                      setState(() => reward = val);
                    },
                    validator: (val) {
                      if (val.isEmpty)  {
                        return 'Offering a reward will increase the chance the people will accept your call';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'What do you offer as reward? (e.g. food, coffe, FIFA game, or anything else...)',
                      hintStyle: TextStyle(
                        color: Colors.white70.withOpacity(0.5),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0,
                    ),
                  ), //type,
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.indigo)
                        )
                    ),
                  ),
                    onPressed: () async {
                    if(formKey.currentState.validate()) {
                      setState(() => loading = true);
                      await HandlyCallsDatabaseService(uid: (_ath.currentUser
                          .uid + ' time ' + (DateTime
                          .now()
                          .millisecondsSinceEpoch).toString()))
                          .createHandlyCall(HandlyCall(
                        title: title,
                        type: type,
                        reward: reward,
                        money: money,
                        name: _ath.currentUser.displayName,
                        score: score,
                        user: _ath.currentUser.uid,
                        description: description,
                        time: DateTime.now(),
                      ));
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
    );
    }
  }
/*
() async {
await HandlyCallsDatabaseService(uid: (user.uid +' time ' + (DateTime.now().millisecondsSinceEpoch).toString())).createHandlyCall(HandlyCall(
title: user.displayName,
type: 'ball',
reward: 'cake',
money: 15,
name: user.displayName,
score:  score,
user: user.uid,
time: DateTime.now(),

));
}
*/
}