import 'package:flutter/material.dart';
import 'package:news_api/model/model.dart';

class TopHeadlinePreview extends StatelessWidget {
  const TopHeadlinePreview({required this.topHeadline, super.key});

  final ArticleResponse topHeadline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(topHeadline.author == "Unable to retrieve author"
              ? "Top Headline"
              : topHeadline.author),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: 400,
                child: topHeadline.urlToImage == "Unable to retrieve image"
                    ? Image.asset("assets/images/image_load_fail.png")
                    : DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(topHeadline.urlToImage),
                              fit: BoxFit.cover),
                        ),
                      )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    topHeadline.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    topHeadline.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    topHeadline.content,
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
