import 'package:flutter/material.dart';
import 'package:kinomonster/pages/description.dart';
import 'package:kinomonster/pages/favorite_page.dart';
import 'package:provider/provider.dart';

import '../models/favorite.dart';

class FavoriteMovies extends StatefulWidget {
  const FavoriteMovies({Key? key, required this.favorite}) : super(key: key);

  final List favorite;


  @override
  State<FavoriteMovies> createState() => _FavoriteMoviesState();
}

class _FavoriteMoviesState extends State<FavoriteMovies> {
  List myfavoriteIDs = [];

  @override
  Widget build(BuildContext context) {

    var args = Provider.of<FavoritesStore>(context).favoritIDs;
    myfavoriteIDs = args;

    return Container(
      color: const Color.fromRGBO(43, 8, 8, 1),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
          itemCount: widget.favorite.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Description(
                          id: widget.favorite[index]['id'],
                          name: widget.favorite[index]['title'],
                          description: widget.favorite[index]['overview'],
                          image: 'http://image.tmdb.org/t/p/w500' + widget.favorite[index]['poster_path'],
                          vote: widget.favorite[index]['vote_average'].toString(),
                          release: widget.favorite[index]['release_date'],
                        )));
              },
              child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  height: 120,
                  //color: Colors.lightGreen,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          'http://image.tmdb.org/t/p/w500' +
                              widget.favorite[index]['poster_path'],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 2, 20, 2),
                        //color: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 240,
                              //color: Colors.green,
                              child: Text(widget.favorite[index]['title'] != null
                                  ? widget.favorite[index]['title']
                                  : 'Loading...',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Рейтинг : ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.favorite[index]['vote_average'] != null
                                      ? widget.favorite[index]['vote_average'].toString()
                                      : 'Loading...',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Container(
                              //color: Colors.red,
                                width: 240,
                                height: 55,
                                child: Text(
                                  widget.favorite[index]['release_date'] != null
                                      ? "Релиз: "+widget.favorite[index]['release_date'].toString()
                                      : 'Loading...',
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                )),
                          ],
                        ),

                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
