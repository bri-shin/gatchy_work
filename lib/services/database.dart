import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference gatchyUser =  Firestore.instance.collection('gatchyUsers');

  Future updateUserData(String username, String goal, int gatchyDay) async {
    return await gatchyUser.document(uid).setData({
      'username': username,
      'goal': goal,
      'gatchyDay': gatchyDay,
    }); 
  }


}