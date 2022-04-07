import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Профиль",
            style: TextStyle(fontFamily: 'RuslanDisplay', fontSize: 23)),
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage("assets/images/default.png"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                user.email!,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    "Выйти",
                    style: TextStyle(fontSize: 17),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

/*Padding(child: Text(user.email!, style: TextStyle(color: Colors.white),), padding: EdgeInsets.all(10)),
              ElevatedButton.icon(
                onPressed: () => FirebaseAuth.instance.signOut(),*/
