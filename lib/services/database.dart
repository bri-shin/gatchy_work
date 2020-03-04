import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gatchy_work/models/goal.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference gatchyUser =
      Firestore.instance.collection('gatchyUsers');

  Future updateUserData(String username, String goal, int gatchyDay) async {
    return await gatchyUser.document(uid).setData({
      'username': username,
      'goal': goal,
      'gatchyDay': gatchyDay,
    });
  }

  // goal list from snapshot
  List<Goal> _goalListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Goal(
          name: doc.data['name'] ?? 'n/a',
          value: doc.data['value'] ?? 0,
          gatchyDay: doc.data['gatchcyDay'] ?? 0);
    }).toList();
  }

  // get goal stream
  Stream<List<Goal>> get goals {
    return gatchyUser.snapshots().map(_goalListFromSnapshot); 
  }

  // get user doc stream
}
