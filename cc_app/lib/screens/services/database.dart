import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference ccCollection =
      Firestore.instance.collection('user_info');

  Future updateUserData(String sugars, String name, int strength) async {
    return await ccCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
