import 'package:flutter/material.dart';
import 'package:news_api/controller/controller.dart';
import 'package:news_api/model/model.dart';
import 'package:news_api/presentation/presentation.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text("News API"),
          centerTitle: false,
        ),
        body: FutureBuilder<List<ArticleResponse>>(
          future: NewsController().fetchNews(),
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
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final newsList = snapshot.data;
              return ListView.separated(
                itemCount: newsList!.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewNews(
                                  news: news,
                                ))),
                    trailing: Icon(Icons.arrow_forward_outlined),
                    title: Text(news.title),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            }
          },
        ));
  }
}
