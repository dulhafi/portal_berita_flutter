import 'package:flutter/material.dart';
import 'package:news_portal/response_news.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: Colors.blue[500],
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),

        children: [
          Image.network(article.urlToImage),
          SizedBox(height: 10),
          Text(article.description),
          SizedBox(height:5),
          Expanded(
            child: Text(
              article.author,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
