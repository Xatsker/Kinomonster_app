import 'package:flutter/material.dart';
import 'package:kinomonster/pages/home_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinomonster',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}