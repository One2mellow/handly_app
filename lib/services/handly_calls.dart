import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:handly_app/models/handly_calls_model.dart';

class HandlyCallsDatabaseService {

  final String uid;
  HandlyCallsDatabaseService({this.uid});
  final CollectionReference handlyCallsCollection = FirebaseFirestore.instance.collection('handlyCalls');

  Future createHandlyCall(HandlyCall call) async {
    return await handlyCallsCollection.doc(uid).set({
      'title': call.title,
      'type': call.type,
      'reward': call.reward,
      'money': call.money,
      'name': call.name,
      'rating': call.score,
      'description': call.description,
      'user': call.user,
      'time': call.time,
    });
  }

  //handly calls from snapshot
  List<HandlyCall> _handlyCallListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return HandlyCall(
        title: document.data()['title'] ?? '',
        type: document.data()['type'] ?? '',
        reward: document.data()['reward'] ?? null,
        money: document.data()['money'] ?? 0,
        name: document.data()['name'] ?? '',
        score: document.data()['score'] ?? 25,
        user: document.data()['user'] ?? null,
      );
    }).toList() ;
  }


  Future getNum() async {
    return await FirebaseFirestore.instance.collection('handlyCalls').snapshots().length;
  }

  //get userProfile stream
  Stream<List<HandlyCall>> get handlyCalls {
    return handlyCallsCollection.snapshots().
    map(_handlyCallListFromSnapshot);
  }

  //delete user profile document
  Future deletUserData(){
    handlyCallsCollection.doc(uid).delete();
  }

}