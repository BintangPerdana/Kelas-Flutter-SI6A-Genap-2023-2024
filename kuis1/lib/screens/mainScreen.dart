import 'package:flutter/material.dart';
import 'package:kuis1/models/news.dart';
import 'package:kuis1/services/apiService.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<MainScreen> {
  final ApiService _apiService = ApiService();

  List<News> _trendingNews = [];

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    final List<Map<String, dynamic>> trendingNewsData =
        await _apiService.getTopHeadlines();

    setState(() {
      _trendingNews = trendingNewsData.map((e) => News.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Bintang'),
      ),
      body: ListView.builder(
        itemCount: _trendingNews.length,
        itemBuilder: (context, index) {
          final News news = _trendingNews[index];
          return ListTile(
            title: Text(news.title),
            subtitle: Text(news.author),
          );
        },
      ),
    )
  }
}
