import 'package:flutter/material.dart';
import 'package:news_portal/detail_page.dart';
import 'package:news_portal/network_services.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        backgroundColor: Colors.blue[500],
      ),
      body: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final article = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(article: article),
                        ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    child: Column(
                      children: [
                        FadeInImage(
                          placeholder: const NetworkImage(
                              "https://static.thenounproject.com/png/459376-200.png"),
                          image: NetworkImage(article.urlToImage),
                          imageErrorBuilder: (context, error, StackTrace) =>
                              Image.network(
                                  "https://static.thenounproject.com/png/459376-200.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    article.author,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  article.publishedAt
                                      .toString()
                                      .substring(0, 10),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
