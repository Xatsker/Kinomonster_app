import 'package:flutter/material.dart';
import 'package:kinomonster/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Trending Movies', color: Colors.white, size: 20),
          Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                    )
                                )
                            ),
                          ),
                          Container(child: Text(trending[index]['title'] != null
                              ? trending[index]['title']
                              : 'Loading...'),)
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
