import 'package:flutter/material.dart';
import 'package:kinomonster/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

//api v3 key: 6a0e7cc3038c68e826fe1f25db1b0801
// api request: https://api.themoviedb.org/3/movie/550?api_key=6a0e7cc3038c68e826fe1f25db1b0801
// api v4 token: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apikey = '6a0e7cc3038c68e826fe1f25db1b0801';
  final String token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, token),
        logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true
    ));

    Map trendingResult = await tmdb.v3.trending.getTrending();
    Map topRatedResult = await tmdb.v3.movies.getTopRated();
    Map tvResult = await tmdb.v3.tv.getPopular();
    print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: modified_text(text: 'Kinomonster', color: Colors.white, size: 25),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
