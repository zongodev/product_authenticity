import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> loginAdmin (String email , String password) async {
     UserCredential adminAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password);
     return adminAuth;

  }
  Future<void> signOut()async {
    await _firebaseAuth.signOut();
  }
  Future<void> resetPass(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
  Future<bool> isAdminEmail(String email) async {

      final adminSnapshot = await _firestore.collection('admin').where('email', isEqualTo: email).get();
      return adminSnapshot.docs.isNotEmpty;

  }
}