import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kinomonster/pages/developers.dart';
import 'package:kinomonster/pages/favorite_page.dart';
import 'package:kinomonster/pages/landing.dart';
import 'package:kinomonster/pages/profile.dart';
import 'package:kinomonster/pages/search.dart';
import 'package:provider/provider.dart';
import 'models/favorite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinema monster',
        theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Scada'),
        initialRoute: '/',
        routes: {
          '/': (context) => Landing(),
          '/profile': (context) => ProfileScreen(),
          '/search': (context) => SearchScreen(),
          '/developers': (context) => AboutDevelopersScreen(),
          '/favorite': (context) => Favorite(),
          //'/description': (context) => Description(name: trending, description: description, image: image, vote: vote, release: release)
        },
      ),
    );
  }
}
