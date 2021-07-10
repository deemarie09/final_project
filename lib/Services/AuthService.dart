import 'package:final_project/Services/DatabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Log in function
  Future loginUser(String email, String password) async {
    try {
      // Call the firebase function to login
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(result.user);
      return result.user;
    } catch (e) {
      print("Error logging in");
      print(e);
      return null;
    }
  }

  // Register function
  Future registerUser(
      String email, String password, String fname, String laname) async {
    try {
      // Call the firebase function to login
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(result.user);

      DatabaseService _dataBaseService = DatabaseService();
      await _dataBaseService.addUserData(result.user.uid, email, fname, laname);

      return result.user;
    } catch (e) {
      print("Error logging in");
      print(e);
      return null;
    }
  }

  // Logout
}
