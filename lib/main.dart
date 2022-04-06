import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kinomonster/pages/developers.dart';
import 'package:kinomonster/pages/favorite_page.dart';
import 'package:kinomonster/pages/landing.dart';
import 'package:kinomonster/pages/profile.dart';
import 'package:kinomonster/pages/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema monster',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Scada'),
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/profile': (context) => Profile(),
        '/search': (context) => SearchScreen(),
        '/developers': (context) => AboutDevelopersScreen(),
        '/favorite': (context) => Favorite(),
        //'/description': (context) => Description(name: trending, description: description, image: image, vote: vote, release: release)
      },
    );
  }
}
