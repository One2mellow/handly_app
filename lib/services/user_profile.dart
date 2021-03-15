import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileDatabaseService {

  final String uid;
  UserProfileDatabaseService({this.uid});
  final CollectionReference userProfilesCollection = FirebaseFirestore.instance.collection('userProfiles');

  Future updateUserData(String name, String email, bool emailVerified, String phone, bool annon, Map skills, int score) async {
    return await userProfilesCollection.doc(uid).set({
      'name': name,
      'annon': annon,
      'skills': skills,
      'score': score,
    });
  }

  //get userProfile stream
  Stream<QuerySnapshot> get profiles {
    return userProfilesCollection.snapshots();
  }

  //delete user profile document
  Future deletUserData(){
    userProfilesCollection.doc(uid).delete();
  }

}