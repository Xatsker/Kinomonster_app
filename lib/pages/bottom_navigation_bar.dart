import 'package:flutter/material.dart';
import 'package:kinomonster/pages/search.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    SearchScreen(),
    HomePage(),
  ];

  Color mainColor = const Color.fromRGBO(2, 119, 189, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          SalomonBottomBarItem(
            selectedColor: Colors.yellow[300],
            icon: const Icon(
              Icons.home,
              size: 20,
            ),
            title: const Text('Главная'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.white,
            icon: const Icon(
              Icons.search,
              size: 20,
            ),
            title: const Text('Поиск'),
          ),
          SalomonBottomBarItem(
            selectedColor: Colors.pinkAccent[100],
            icon: const Icon(
              Icons.favorite_border,
              size: 20,
            ),
            title: const Text('Избранное'),
          ),
        ],
      ),
    );
  }
}
