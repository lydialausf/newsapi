import 'package:flutter/material.dart';
import 'package:news_api/controller/news_controller.dart';
import 'package:news_api/model/model.dart';
import 'package:news_api/presentation/presentation.dart';

class WallStreetArticleList extends StatefulWidget {
  const WallStreetArticleList({super.key});

  @override
  State<WallStreetArticleList> createState() => _WallStreetArticleListState();
}

class _WallStreetArticleListState extends State<WallStreetArticleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wall Street Article'),
        ),
        body: FutureBuilder<List<ArticleResponse>>(
            future: NewsController().fetchWallStreet(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fetching...',
                    )
                  ],
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final headlineList = snapshot.data;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final headline = headlineList[index];
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppleArticlePreview(
                                    appleArticle: headline))),
                        trailing: Icon(Icons.arrow_forward_ios_outlined),
                        title: Text(headline.title),
                        subtitle: Text(headline.description),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: headlineList!.length);
              }
            }));
  }
}
