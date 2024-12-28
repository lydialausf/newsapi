import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class PreviewNews extends StatefulWidget {
  const PreviewNews({required this.news, super.key});

  final ArticleResponse news;

  @override
  State<PreviewNews> createState() => _PreviewNewsState();
}

class _PreviewNewsState extends State<PreviewNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            widget.news.urlToImage.isNotEmpty
                ? Image.network(
                    widget.news.urlToImage,
                  )
                : Text('No Image'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.news.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.news.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.news.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        )));
  }
}
