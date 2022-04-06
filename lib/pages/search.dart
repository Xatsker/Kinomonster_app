import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _dramaHasBeenPressed = false;
  bool _comedyHasBeenPressed = false;
  bool _cartoonHasBeenPressed = false;
  bool _thrillerHasBeenPressed = false;
  bool _horrorHasBeenPressed = false;
  bool _scienceFictionHasBeenPressed = false;
  bool _actionHasBeenPressed = false;
  bool _melodramaHasBeenPressed = false;
  bool _detectiveHasBeenPressed = false;
  bool _adventuresHasBeenPressed = false;
  bool _fantasyHasBeenPressed = false;
  bool _warHasBeenPressed = false;
  bool _westernHasBeenPressed = false;
  bool _animeHasBeenPressed = false;
  bool _historicalHasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Поиск", style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 ),),
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      //filled: true,
                      //fillColor: const Color.fromRGBO(255, 255, 255, 230),
                      contentPadding: const EdgeInsets.only(left: 10),
                      //icon:
                      hintText: "Введите название...",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 170),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5, top: 7),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 38,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, top: 30),
              child: const Text(
                "Жанры:",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 2),
                child: Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _dramaHasBeenPressed =
                                    !_dramaHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _dramaHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("драма", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _comedyHasBeenPressed =
                                    !_comedyHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _comedyHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("комедия", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _cartoonHasBeenPressed =
                                    !_cartoonHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _cartoonHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("мультфильм", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _thrillerHasBeenPressed =
                                    !_thrillerHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _thrillerHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("триллер", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _horrorHasBeenPressed =
                                    !_horrorHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _horrorHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("ужасы", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _scienceFictionHasBeenPressed =
                                    !_scienceFictionHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _scienceFictionHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("фантастика", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _actionHasBeenPressed =
                                    !_actionHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _actionHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("боевик", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _melodramaHasBeenPressed =
                                    !_melodramaHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _melodramaHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("мелодрама", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _detectiveHasBeenPressed =
                                    !_detectiveHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _detectiveHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("детектив", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _adventuresHasBeenPressed =
                                    !_adventuresHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _adventuresHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("приключения", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _fantasyHasBeenPressed =
                                    !_fantasyHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _fantasyHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("фэнтези", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _warHasBeenPressed =
                                    !_warHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _warHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("военный", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _westernHasBeenPressed =
                                    !_westernHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _westernHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("вестерн", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _animeHasBeenPressed =
                                    !_animeHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _animeHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("аниме", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 4, right: 4, top: 2),
                              child: ElevatedButton(
                                onPressed: () => {
                                  setState(() {
                                    _historicalHasBeenPressed =
                                    !_historicalHasBeenPressed;
                                  })
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: _historicalHasBeenPressed
                                      ? Colors.red
                                      : const Color.fromRGBO(125, 0, 0, 1),
                                ),
                                child: const Text("исторический", style: TextStyle( fontSize: 15 ),),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
    );
  }
}