import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news/components/searchbar.dart';
import '../utils/key.dart';

Future<List> fetchNews() async {
  var url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=${Key.key}&q=${Searchbar.searchController.text}');
  final response = await http.get(url);

  Map result = jsonDecode(response.body);
  //Map result = json.decode(response.body);
  print('Fetched');

  return (result['articles']);
}
