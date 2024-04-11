import 'dart:io';

import 'package:flutter/material.dart';
import 'package:linkpeek/linkpeek.dart';
import 'package:linkpeek/models/linkpeek.model.dart';
import 'package:omnispace/App/Features/News/Model/news_model.dart';
import 'package:omnispace/App/Service/api/api_constants.dart';
import 'package:omnispace/App/Service/api/api_service.dart';
import 'package:omnispace/App/Service/location/location.dart';

import '../../../Widgets/top_card.dart';

class NewsLists extends StatefulWidget {
  const NewsLists({Key? key}) : super(key: key);

  @override
  State<NewsLists> createState() => _NewsListsState();
}

class _NewsListsState extends State<NewsLists> {
  final ApiGets _apiGets = ApiGets();
  LinkPeekModel? linkPeekModel;
  List<LinkPeekModel> linkPeekModelList = [];

  Future<List<LinkPeekModel>> getNews({required BuildContext context}) async {
    print('news list :');
    final news =
        await _apiGets.getNews(route: APIConst.newstories, context: context);
    for (var i = 0; i < news.length; i++) {
      final url = news[i]?.url;
      final linkPeek = await LinkPeek.fromUrl(url!);
      linkPeekModel = LinkPeekModel(
        title: linkPeek.title,
        description: linkPeek.description,
        thumbnail: linkPeek.thumbnail,
        url: linkPeek.url,
        webIcon: linkPeek.webIcon,
      );
      linkPeekModelList.add(linkPeekModel!);
    }

    return linkPeekModelList;
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    final lat = location.latitude;
    final lon = location.longitude;
    final weather = await _apiGets.getWeather(
        route: APIConst.forecastlat + '/:$lat/:$lon', context: context);
    print('weather : $weather');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.support_agent_rounded,
          color: Colors.teal,
        ),
      ),
      appBar: AppBar(
          // backgroundColor: Colors.teal[700],
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/omnispace.png',
            ),
          ),
          centerTitle: true,
          title: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Omni',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontFamily: 'Roboto',
                  ),
                ),
                TextSpan(
                  text: 'Space',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          )),
      body: Column(
        children: [
          TopCard(),
          Expanded(
            child: FutureBuilder<List<LinkPeekModel>>(
              future: getNews(context: context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].title!),
                        subtitle: Text(snapshot.data![index].description!),
                        leading: Image.network(
                          snapshot.data![index].thumbnail!,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(snapshot.data![index].title!),
                                content: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data![index].thumbnail!,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                    Text(snapshot.data![index].description!),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
