import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  CollectionReference userRef = Firestore.instance.collection('Users');
  //CollectionReference foodsList = Firestore.instance.collection("foods");

  Future addUserData(
      String userId, String email, String fname, String laname) async {
    return await userRef.document(userId).setData({
      'email': email,
      'fname': fname,
      'laname': laname,
    });
  }
}
