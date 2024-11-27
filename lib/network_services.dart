import 'package:http/http.dart' as http;
import 'package:news_portal/response_news.dart';

Future<List<Article>> fetchNews () async {
  final response = await http
      .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c2f401956422406982903d21460facac'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final ResponseNews responseNews = responseNewsFromJson(response.body);
    return responseNews.articles ;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load News');
  }
}
