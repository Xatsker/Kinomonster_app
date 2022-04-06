import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(child: Text(user.email!, style: TextStyle(color: Colors.white),), padding: EdgeInsets.all(10)),
              ElevatedButton.icon(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: Icon(Icons.arrow_back, size: 32),
                label: Text('Sign Out', style: TextStyle(fontSize: 24, color: Colors.white)),
              )
            ],
          ),
        ));
  }
}
