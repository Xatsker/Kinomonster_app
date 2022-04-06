import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinomonster/pages/authorization.dart';

import 'bottom_navigation_bar.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bool _isLogin = false;
    //return _isLogin ? HomePage() : AuthorizationPage();

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasError) {
            return Center(child: Text('Что-то пошло не так'));
          }
          if(snapshot.hasData) {
            return BottomNavigation();
          }
          else {
            return AuthorizationPage();
          }

        }
      )
    );
  }
}
