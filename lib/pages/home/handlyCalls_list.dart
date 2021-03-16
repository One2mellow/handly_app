import 'package:flutter/material.dart';
import 'package:handly_app/models/handly_calls_model.dart';
import 'package:provider/provider.dart';
import 'package:handly_app/pages/home/handlyCalls_tile.dart';

class HandlyCallsList extends StatefulWidget {

  @override
  _HandlyCallsListState createState() => _HandlyCallsListState();
}

class _HandlyCallsListState extends State<HandlyCallsList> {


  @override
  Widget build(BuildContext context) {
    
    
    final handlyCalls = Provider.of<List<HandlyCall>>(context);
    
    return ListView.builder(
      itemCount: handlyCalls.length,
        itemBuilder: (context, index) {
        return HandlyCallTile(handlyCall: handlyCalls[index],);
        }
    );
  }
}
