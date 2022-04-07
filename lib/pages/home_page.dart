import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final user = FirebaseAuth.instance.currentUser!;

  final String apikey = '6a0e7cc3038c68e826fe1f25db1b0801';
  final String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }


  loadMovies() async {
    TMDB tmdb = TMDB(ApiKeys(apikey, token),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    //tmdb.v3.account.markAsFavorite(sessionId, accountId, mediaId, mediaType);
    //tmdb.v3.account.getFavoriteMovies(sessionId, accountId);

    //tmdb.v3.account.getFavoriteMovies(t1, accountId);

    Map trendingResult = await tmdb.v3.trending.getTrending();

    print(trendingResult);

    setState(() {
      trendingMovies = trendingResult['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
        leading: IconButton(
            onPressed: () => {Navigator.pushNamed(context, '/developers')},
            icon: const Icon(Icons.info_outline)),
        title: const Text("Киномонстр", style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 )),
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
