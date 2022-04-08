import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinomonster/widgets/favorite_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:provider/provider.dart';

import '../widgets/trending.dart';

import '../models/favorite.dart';
import 'description.dart';
//api v3 key: 6a0e7cc3038c68e826fe1f25db1b0801
// api request: https://api.themoviedb.org/3/movie/550?api_key=6a0e7cc3038c68e826fe1f25db1b0801
// api v4 token: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List favoriteMovies = [];
  List myfavoriteIDs = [];
  final user = FirebaseAuth.instance.currentUser!;

  final String apikey = '6a0e7cc3038c68e826fe1f25db1b0801';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0';

  @override
  void initState() {
    super.initState();
  }

  loadMovieById(int movieId) async {
    TMDB tmdb = TMDB(ApiKeys(apikey, token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    //tmdb.v3.account.markAsFavorite(sessionId, accountId, mediaId, mediaType);
    //tmdb.v3.account.getFavoriteMovies(sessionId, accountId);

    //tmdb.v3.account.getFavoriteMovies(t1, accountId);

    Map favoriteResult = await tmdb.v3.movies.getDetails(movieId);

    //print(favoriteResult);
    return favoriteResult;
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as List;
    var args = Provider.of<FavoritesStore>(context).favoritIDs;
    myfavoriteIDs = args;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
        title: const Text("Избранное", style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 )),
        centerTitle: true,
      ),
      body:

      ListView.builder(
          itemCount: args.length ,
          itemBuilder: (context, index) {
            //favoriteMovies = loadMoviesById(args[index]);
            //return Text(myfavoriteIDs.toString(), style: TextStyle(color: Colors.white));
            //if (index == 0) return Container();
            //favoriteMovies = loadMoviesById(args[index]);
            //return Text(favoriteMovies[index].toString());


           return FutureBuilder(
              future: loadMovieById(myfavoriteIDs[index]),
              builder: (context, snapshot) {
                print(snapshot.error);
                var s = snapshot.data as Map;
                return (snapshot.hasData) ?

              Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                              id: s['id'],
                              name: s['title'],
                              description: s['overview'],
                              image: 'http://image.tmdb.org/t/p/w500' + s['poster_path'],
                              vote: s['vote_average'].toString(),
                              release: s['release_date'],
                            )));
                  },
                  tileColor: Color.fromRGBO(43, 8, 8, 1),
                  textColor: Colors.white,
                  minVerticalPadding: 10,
                  hoverColor: Colors.white,
                  title: Column(
                    children: [
                      Text(s['title']),
                      Text(s['vote_average'].toString()),
                      Text(s['release_date'].toString())
                    ],
                  ),
                  leading:  Image.network('http://image.tmdb.org/t/p/w500' + s['poster_path'])
                ),
              ) : Card(
                child: Center(child: CircularProgressIndicator(),),
              );
              }
            );
          }
    )
    );
  }

}
