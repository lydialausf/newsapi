import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class AppleArticlePreview extends StatelessWidget {
  const AppleArticlePreview({required this.appleArticle, super.key});

  final ArticleResponse appleArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appleArticle.author == "Unable to retrieve author"
              ? "Apple Article"
              : appleArticle.author),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: appleArticle.urlToImage == "Unable to retrieve image"
                    ? Image.asset("assets/images/image_load_fail.png")
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(appleArticle.urlToImage),
                              fit: BoxFit.cover),
                        ),
                      )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    appleArticle.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    appleArticle.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    appleArticle.content,
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
