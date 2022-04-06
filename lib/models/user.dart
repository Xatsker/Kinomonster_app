import 'package:firebase_auth/firebase_auth.dart';

class OurUser {
  String? id;
  OurUser.fromFirebase(User user) {
    id = user.uid;
  }
}