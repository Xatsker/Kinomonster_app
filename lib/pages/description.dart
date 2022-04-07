import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/author.dart';

class Description extends StatefulWidget {
  final String name, description, image, vote, release;
  final int id;

  const Description(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.vote,
      required this.release})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool isFavorite = false;

  saveFavorite() async {

  }

  removeFavorite() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
          title:  Text(widget.name, style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 )),
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
                      child: Image.network(
                          'http://image.tmdb.org/t/p/w500' +
                              widget.image,
                          fit: BoxFit.fill),
                    ),
                    Container(
                      height: 270,
                      width: 141,
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            //padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //color: Colors.red,
                            child: SvgPicture.asset("assets/svg/Vector.svg"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              widget.vote,
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                        setState(() {
                                          (!isFavorite ? saveFavorite() : removeFavorite());
                                        });
                                      },
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 50,
                                      color: (isFavorite) ? Colors.red : Colors.white)
                              ),
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
                  child: Text(widget.name,
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
                      widget.description,
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
