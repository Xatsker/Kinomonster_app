import 'package:firebase_auth/firebase_auth.dart';
import 'package:kinomonster/models/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user!;
      return OurUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future registerInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = authResult.user!;
      return OurUser.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }
}
