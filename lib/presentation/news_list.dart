import 'package:flutter/material.dart';
import 'package:news_api/presentation/presentation.dart';
import 'package:news_api/global/global.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key});

  final List<String> headlineList = [
    "All articles mentioning Apple from yesterday",
    "All articles about Tesla from the last month",
    "Top business headlines in the US right now",
    "Top headlines from TechCrunch right now",
    "All articles published by the Wall Street Journal in the last 6 months",
  ];

  @override
  Widget build(BuildContext context) {
    final isScreenLarge = context.isScreenLarge;
    final isScreenMedium = context.isScreenMedium;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text("News API"),
          centerTitle: false,
        ),
        body: GridView.count(
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            padding: isScreenLarge
                ? EdgeInsets.symmetric(horizontal: 500, vertical: 50)
                : isScreenMedium
                    ? EdgeInsets.symmetric(horizontal: 200, vertical: 50)
                    : null,
            children: [
              for (var headline in headlineList)
                GestureDetector(
                  onTap: () {
                    for (var i = 0; i < headlineList.length; i++) {
                      if (headline == headlineList[i]) {
                        switch (i) {
                          case 0:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppleArticleList()));
                            break;
                          case 1:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeslaArticleList()));
                            break;
                          case 2:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TopHeadlineList()));
                            break;
                          case 3:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TechCrunchList()));
                            break;
                          case 4:
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WallStreetArticleList()));
                            break;
                        }
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Center(
                        child: Text(
                          headline,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
            ]));
  }
}
