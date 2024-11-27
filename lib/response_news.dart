import 'dart:convert';

ResponseNews responseNewsFromJson(String str) => ResponseNews.fromJson(json.decode(str));


class ResponseNews {
    String status;
    int totalResults;
    List<Article> articles;

    ResponseNews({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory ResponseNews.fromJson(Map<String, dynamic> json) => ResponseNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

}

class Article {
    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Tidak ada author',
        title: json["title"] ?? 'Tidak ada title',
        description: json["description"] ?? 'Tidak ada deskripsi',
        url: json["url"] ?? 'www.google.com',
        urlToImage: json["urlToImage"] ?? 'https://www.kliknusae.com/img/404.jpg',
        publishedAt: json["publishedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'No content',
    );
}

class Source {
    String? id;
    String? name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );


}
