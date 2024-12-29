import 'package:flutter/material.dart';
import 'package:news_api/controller/news_controller.dart';
import 'package:news_api/model/model.dart';
import 'package:news_api/presentation/top_headline/top_headline_preview.dart';

class TopHeadlineList extends StatefulWidget {
  const TopHeadlineList({super.key});

  @override
  State<TopHeadlineList> createState() => _TopHeadlineListState();
}

class _TopHeadlineListState extends State<TopHeadlineList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Headlines'),
        ),
        body: FutureBuilder<List<ArticleResponse>>(
            future: NewsController().fetchTopHeadlines(),
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
                                builder: (context) =>
                                    TopHeadlinePreview(topHeadline: headline))),
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
