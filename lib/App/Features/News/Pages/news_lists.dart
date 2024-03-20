import 'package:flutter/material.dart';

import '../../../Widgets/top_card.dart';

class NewsLists extends StatefulWidget {
  const NewsLists({super.key});

  @override
  State<NewsLists> createState() => _NewsListsState();
}

class _NewsListsState extends State<NewsLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.teal[600],
            title: const Text('OmniSpace'),
          ),
          body: Column(
            children: [
              TopCard(),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Item 2'),
                        subtitle: Text('Description 2'),
                        leading: Icon(Icons.access_alarm),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 3'),
                        subtitle: Text('Description 3'),
                        leading: Icon(Icons.access_time),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 4'),
                        subtitle: Text('Description 4'),
                        leading: Icon(Icons.account_balance),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 5'),
                        subtitle: Text('Description 5'),
                        leading: Icon(Icons.account_box),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 6'),
                        subtitle: Text('Description 6'),
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 7'),
                        subtitle: Text('Description 7'),
                        leading: Icon(Icons.account_tree),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 8'),
                        subtitle: Text('Description 8'),
                        leading: Icon(Icons.add),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 9'),
                        subtitle: Text('Description 9'),
                        leading: Icon(Icons.add_a_photo),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 10'),
                        subtitle: Text('Description 10'),
                        leading: Icon(Icons.add_alarm),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 11'),
                        subtitle: Text('Description 11'),
                        leading: Icon(Icons.add_alert),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text('Item 12'),
                        subtitle: Text('Description 12'),
                        leading: Icon(Icons.add_box),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
