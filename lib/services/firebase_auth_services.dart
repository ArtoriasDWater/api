import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return res.user;
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async => await _auth.signOut();
  
}