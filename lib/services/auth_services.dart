import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  static Future<auth.User> signUpWithEmailAndPassword(
      String fullname, String email, String password) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user.uid)
          .set({
        'fullname': fullname,
        'email': email,
      });
      auth.User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  static Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  static Stream<auth.User> get firebaseUserStream => _auth.authStateChanges();
}
