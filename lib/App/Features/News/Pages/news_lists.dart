import 'package:flutter/material.dart';
import 'package:omnispace/App/Features/News/Model/news_model.dart';
import 'package:omnispace/App/Service/api/api_constants.dart';
import 'package:omnispace/App/Service/api/api_service.dart';

import '../../../Widgets/top_card.dart';

class NewsLists extends StatefulWidget {
  const NewsLists({Key? key}) : super(key: key);

  @override
  State<NewsLists> createState() => _NewsListsState();
}

class _NewsListsState extends State<NewsLists> {
  final ApiGets _apiGets = ApiGets();

  Future<List<News?>> getNews({required BuildContext context}) async {
    print('object');
    final news =
        await _apiGets.getNews(route: APIConst.newstories, context: context);
    return news;
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
        backgroundColor: Colors.teal[600],
        title: const Text('OmniSpace'),
      ),
      body: Column(
        children: [
          TopCard(),
          Expanded(
            child: FutureBuilder<List<News?>>(
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
                          leading: const Icon(
                            Icons.article,
                            size: 40,
                            color: Colors.teal,
                          ),
                          title: Text(
                            snapshot.data?[index]?.title ?? 'No title',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(snapshot.data?[index]?.url ?? 'No url',
                              style: const TextStyle(
                                fontWeight: FontWeight.w100,
                              )));
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
