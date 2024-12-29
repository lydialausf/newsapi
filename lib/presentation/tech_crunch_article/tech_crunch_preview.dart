import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class TechcrunchPreview extends StatelessWidget {
  const TechcrunchPreview({required this.techCrunchArticle, super.key});

  final ArticleResponse techCrunchArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(techCrunchArticle.author == "Unable to retrieve author"
              ? "Apple Article"
              : techCrunchArticle.author),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: techCrunchArticle.urlToImage ==
                        "Unable to retrieve image"
                    ? Image.asset("assets/images/image_load_fail.png")
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(techCrunchArticle.urlToImage),
                              fit: BoxFit.cover),
                        ),
                      )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    techCrunchArticle.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    techCrunchArticle.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    techCrunchArticle.content,
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
