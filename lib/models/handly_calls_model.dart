
import 'package:cloud_firestore/cloud_firestore.dart';


class HandlyCall {

  final String title;
  final String type;
  final String reward;
  final int money;
  final String name;
  final int score;
  final String user;
  final String description;
  var time;
  GeoPoint location;

  HandlyCall({this.title, this.type, this.reward, this.money, this.name, this.score, this.user, this.description, this.time, this.location});

}