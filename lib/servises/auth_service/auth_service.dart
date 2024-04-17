import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> loginAdmin (String email , String password) async {
     UserCredential adminAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password);
     return adminAuth;

  }
  Future<void> signOut()async {
    await _firebaseAuth.signOut();
  }
}