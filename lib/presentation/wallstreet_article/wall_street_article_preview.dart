import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class WallStreetArticlePreview extends StatelessWidget {
  const WallStreetArticlePreview({required this.wallStreetArticle, super.key});

  final ArticleResponse wallStreetArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(wallStreetArticle.author == "Unable to retrieve author"
              ? "Apple Article"
              : wallStreetArticle.author),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: wallStreetArticle.urlToImage ==
                        "Unable to retrieve image"
                    ? Image.asset("assets/images/image_load_fail.png")
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(wallStreetArticle.urlToImage),
                              fit: BoxFit.cover),
                        ),
                      )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    wallStreetArticle.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    wallStreetArticle.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    wallStreetArticle.content,
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
