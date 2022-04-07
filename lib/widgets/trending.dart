import 'package:flutter/material.dart';
import 'package:kinomonster/pages/description.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  final List trending;

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {

  @override
  Widget build(BuildContext context) {
    return Container(
            color: const Color.fromRGBO(43, 8, 8, 1),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                itemCount: widget.trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  id: widget.trending[index]['id'],
                                  name: widget.trending[index]['title'],
                                  description: widget.trending[index]['overview'],
                                  image: 'http://image.tmdb.org/t/p/w500' + widget.trending[index]['poster_path'],
                                  vote: widget.trending[index]['vote_average'].toString(),
                                  release: widget.trending[index]['release_date'],
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
                                    widget.trending[index]['poster_path'],
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
                                    child: Text(widget.trending[index]['title'] != null
                                        ? widget.trending[index]['title']
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
                                        widget.trending[index]['vote_average'] != null
                                            ? widget.trending[index]['vote_average'].toString()
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
                                        widget.trending[index]['release_date'] != null
                                            ? "Релиз: "+widget.trending[index]['release_date'].toString()
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
