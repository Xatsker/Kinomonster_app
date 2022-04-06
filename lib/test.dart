import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailedViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        title: const Text("Киномонстр", style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 )),
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          Container(
            color: const Color.fromRGBO(43, 8, 8, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset("assets/images/default.png",
                          fit: BoxFit.fill),
                    ),
                    Container(
                      height: 270,
                      width: 141,
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //color: Colors.red,
                            width: 134,
                            height: 155,
                            child: SvgPicture.asset("assets/svg/Vector.svg", fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "8.7",
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: const [
                              Expanded(
                                  child: Icon(Icons.favorite_border,
                                      color: Colors.white, size: 50)),
                              Expanded(
                                  child: Icon(Icons.share,
                                      color: Colors.white, size: 50))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  //color: Colors.black,
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Text("Название Фильма",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                      maxLines: 2,
                      softWrap: true),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: Text(
                      "Подробное описание: ----------------------------------------------------------------------",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      softWrap: true),
                ),
                const SizedBox(height: 10,),
                const Text(
                    "Жанры:",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    softWrap: true),

                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                  child: Text(
                      "--------------------------------------------------------------------------",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      softWrap: true),
                ),
                Row(
                  children: [
                    const Text("Режиссёр: ",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("Имя Фамилия",
                        style: TextStyle(fontSize: 16, color: Colors.white))
                  ],
                ),
                Container(
                  //color: Colors.black,
                  margin: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                  child: const Text(
                    "Актёры",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: createAuthorColumn([
                        const Author("Имя", "Фамилия", "фото"),
                        const Author("Имя", "Фамилия", "фото"),
                        const Author("Имя", "Фамилия", "фото"),
                      ]),
                    ),
                    Expanded(
                      child: createAuthorColumn([
                        const Author("Имя", "Фамилия", "фото"),
                        const Author("Имя", "Фамилия", "фото"),
                        const Author("Имя", "Фамилия", "фото"),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createAuthorColumn(List<Author> authors) {
    final rows = <Widget>[];
    for (int i = 0; i < authors.length; i++) {
      rows.add(Padding(
        padding: i < authors.length - 1
            ? const EdgeInsets.only(bottom: 16)
            : EdgeInsets.zero,
        child: Row(
          children: [
            CircleAvatar(child: Image.network(authors[i].imageUrl)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(authors[i].name, style: const TextStyle( color: Colors.white, fontSize: 16 )),
                  Text(authors[i].surName, style: const TextStyle( color: Colors.white, fontSize: 16 )),
                ],
              ),
            ),
          ],
        ),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }
}

class Author {
  final String name;
  final String surName;
  final String imageUrl;

  const Author(this.name, this.surName, this.imageUrl);
}

