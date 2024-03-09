import 'package:flutter/material.dart';
import 'package:pilem/models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                movie.posterPath != ''
                    ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
                    : 'https://via.placeholder.com/50x50.png?text=No+Image',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Overview :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                movie.overview,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Release Date : ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(movie.releaseDate)
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Rating : ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(movie.voteAverage.toString())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
