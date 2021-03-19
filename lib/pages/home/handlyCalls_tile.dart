import 'package:flutter/material.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:handly_app/pages/handly_calls/handly_call_details.dart';

class HandlyCallTile extends StatelessWidget {
  final HandlyCall handlyCall;

  HandlyCallTile({this.handlyCall});

  @override
  Widget build(BuildContext context) {
    String _rwrd;
    if (handlyCall.reward == ''){
       _rwrd = handlyCall.money.toString() + ' ₪';
    } else {
      _rwrd = handlyCall.reward;
    }
    return Padding(
        padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTileTheme(
          child: ExpansionTile(
            leading: Icon(Icons.pin_drop_outlined),
            title: Text(handlyCall.title),
            subtitle: Text('${handlyCall.name} offers a reward of: $_rwrd '),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 10, 10),
                    child: Column(
                      children: [
                        Text(
                            'Type of help needed: ${handlyCall.type}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          handlyCall.description,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              ],
          ),
        ),
      ),
    );
  }
}
