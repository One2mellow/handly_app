import 'package:flutter/material.dart';
import 'package:handly_app/models/handly_calls_model.dart';

class HandlyCallDetails extends StatelessWidget {

  final HandlyCall handlycall;

  HandlyCallDetails({this.handlycall});


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(3, 218, 198, 0.7),
      clipBehavior: Clip.antiAlias,
      elevation: 0.0,
      child: Column(
        children: [
          SizedBox(height: 5,),
          Container(
            height: MediaQuery.of(context).size.height * 0.065,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color.fromRGBO(1, 135, 134, 0.7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  handlycall.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Comforta',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Type of help needed: ${handlycall.type}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}