import 'dart:convert';

import 'package:news_api/model/model.dart';
import 'package:http/http.dart' as http;

class NewsController {
  Future<List<ArticleResponse>> fetchNews() async {
    final apiKey = 'c1352ba1b49f4522a8c416e74a468545';
    final apiUrl =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articlesData = data['articles'];
      List<ArticleResponse> articles = articlesData.map((articleData) {
        return ArticleResponse.fromJson(articleData);
      }).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
