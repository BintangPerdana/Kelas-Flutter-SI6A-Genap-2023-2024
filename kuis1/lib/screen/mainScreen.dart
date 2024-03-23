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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNewsList('Trending News', _trendingNews),
          ],
        ),
      ),
    );
  }
Widget _buildNewsList(String title, List<News> news) {
  return Column(
    
  )
}}
