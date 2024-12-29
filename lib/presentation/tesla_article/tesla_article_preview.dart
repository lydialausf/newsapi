import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class TeslaArticlePreview extends StatelessWidget {
  const TeslaArticlePreview({required this.teslaArticle, super.key});

  final ArticleResponse teslaArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(teslaArticle.author == "Unable to retrieve author"
              ? "Apple Article"
              : teslaArticle.author),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: teslaArticle.urlToImage == "Unable to retrieve image"
                    ? Image.asset("assets/images/image_load_fail.png")
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(teslaArticle.urlToImage),
                              fit: BoxFit.cover),
                        ),
                      )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    teslaArticle.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    teslaArticle.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    teslaArticle.content,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }
}
