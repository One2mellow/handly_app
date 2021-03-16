import 'package:flutter/material.dart';
import 'package:handly_app/models/handly_calls_model.dart';

class HandlyCallTile extends StatelessWidget {

  final HandlyCall handlyCall;

  HandlyCallTile({this.handlyCall});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTileTheme(
          child: ListTile(
            leading: Icon(Icons.pin_drop_outlined),
            title: Text(handlyCall.title),
            subtitle: Text('${handlyCall.name} offers a reward of: ${handlyCall.reward['food']}'),
          ),
        ),
      ),
    );
  }
}
