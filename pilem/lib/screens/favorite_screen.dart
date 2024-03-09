import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Movie> _favoriteMovies = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteMovies();
  }

  Future<void> _loadFavoriteMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favoriteMovieIds =
        prefs.getKeys().where((key) => key.startsWith('movie_')).toList();
    print('favoriteMovieIds : $favoriteMovieIds');

    setState(() {
      _favoriteMovies = favoriteMovieIds
          .map((id) {
            final String? movieJson = prefs.getString(id);
            if (movieJson != null && movieJson.isNotEmpty) {
              final Map<String, dynamic> movieData = jsonDecode(movieJson);
              return Movie.fromJson(movieData);
            }
            return null;
          })
          .where((movie) => movie != null)
          .cast<Movie>()
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
