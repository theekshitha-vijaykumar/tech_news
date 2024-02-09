import 'package:flutter/material.dart';
import 'package:tech_news/backend/functions.dart';
import 'package:tech_news/components/news_tile.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/constants.dart';

import '../components/appbar.dart';
import '../components/searchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const Appbar(),
      body: Column(
        children: [
          const Searchbar(),
          Expanded(
              child: SizedBox(
            width: width,
            child: FutureBuilder<List>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsTile(
                            title: snapshot.data![index]['title'],
                            imageUrl: snapshot.data![index]['urlToImage'] ??
                                Constants.imageUrl,
                            description:
                                snapshot.data![index]['description'].toString(),
                            time: snapshot.data![index]['publishedAt'],
                            url: snapshot.data![index]['url'],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
