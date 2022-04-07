import 'package:flutter/material.dart';

class AboutDevelopersScreen extends StatelessWidget {
  const AboutDevelopersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("О разработчике",
            style: TextStyle(fontFamily: 'RuslanDisplay', fontSize: 23)),
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: const Text(
              "Киномонстр",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'RuslanDisplay',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 80),
            alignment: Alignment.center,
            child: const Text("Версия 1.0",
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
          ),
          const Text("Разработчики:",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 25),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      //margin: const EdgeInsets.only(right: 40),
                      child: Text("Голосовская М.",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Expanded(
                      child: Text("example@gmail.com",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text("Шнэк Д.",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Expanded(
                      child: Text("example@gmail.com",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                      //margin: const EdgeInsets.only(right: 40),
                      child: Text("Мурзикова М.",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    Expanded(
                      child: Text("example@gmail.com",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
