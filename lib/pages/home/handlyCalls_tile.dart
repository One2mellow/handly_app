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
          child: ListTile(
            onTap: () {
              showModalBottomSheet(context: context, builder: (context) {
                return HandlyCallDetails(handlycall: handlyCall,);
              },
                backgroundColor: Color.fromRGBO(3, 218, 198, 0.2),
                barrierColor: Colors.indigo.withOpacity(0.25),
              );
            },
            leading: Icon(Icons.pin_drop_outlined),
            title: Text(handlyCall.title),
            subtitle: Text('${handlyCall.name} offers a reward of: $_rwrd '),
          ),
        ),
      ),
    );
  }
}
