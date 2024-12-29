import 'dart:convert';

import 'package:news_api/model/model.dart';
import 'package:http/http.dart' as http;

class NewsController {
  Future<List<ArticleResponse>> fetchTopHeadlines() async {
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

  Future<List<ArticleResponse>> fetchApple() async {
    final apiKey = 'c1352ba1b49f4522a8c416e74a468545';
    final apiUrl =
        'https://newsapi.org/v2/everything?q=apple&from=2024-12-27&to=2024-12-27&sortBy=popularity&apiKey=$apiKey';
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

  Future<List<ArticleResponse>> fetchTesla() async {
    final apiKey = 'c1352ba1b49f4522a8c416e74a468545';
    final apiUrl =
        'https://newsapi.org/v2/everything?q=tesla&from=2024-12-28&sortBy=publishedAt&apiKey=$apiKey';
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

  Future<List<ArticleResponse>> fetchTechCrunch() async {
    final apiKey = 'c1352ba1b49f4522a8c416e74a468545';
    final apiUrl =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';
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

  Future<List<ArticleResponse>> fetchWallStreet() async {
    final apiKey = 'c1352ba1b49f4522a8c416e74a468545';
    final apiUrl =
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey';
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
