import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=5118eb78938a4ead9c4c1657d4c571ac';
    var response = await http.get(Uri.parse(url));
    // var response = await http.get(url);
    // http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImge: element['urlToImage'],
            content: element['context']
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = 'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=5118eb78938a4ead9c4c1657d4c571ac';
    var response = await http.get(Uri.parse(url));
    // var response = await http.get(url);
    // http.Response response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImge: element['urlToImage'],
              content: element['context']
          );
          news.add(articleModel);
        }
      });
    }
  }
}