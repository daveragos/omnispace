import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:any_link_preview/any_link_preview.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Colors.teal[600],
            title: const Text('OmniSpace'),
          ),
          body: Column(
            children: [
              TopCard(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: AnyLinkPreview(
                          link:
                              'https://kazlauskas.dev/blog/flutter-generative-ai-app-using-gemini/',
                          displayDirection: UIDirection.uiDirectionHorizontal,
                          cache: Duration(hours: 1),
                          backgroundColor: Colors.grey[300],

                          // Widget to display when there's
                          // an error fetching preview
                          errorWidget: Container(
                            color: Colors.grey[300],
                            child: Text('Oops!'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: AnyLinkPreview(
                          link:
                              'https://kazlauskas.dev/blog/flutter-generative-ai-app-using-gemini/',
                          showMultimedia: true,
                          displayDirection: UIDirection.uiDirectionHorizontal,
                        ),
                      ),
                      const ListTile(
                        title: Text('Item 2'),
                        subtitle: Text('Description 2'),
                        leading: Icon(Icons.access_alarm),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 3'),
                        subtitle: Text('Description 3'),
                        leading: Icon(Icons.access_time),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 4'),
                        subtitle: Text('Description 4'),
                        leading: Icon(Icons.account_balance),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 5'),
                        subtitle: Text('Description 5'),
                        leading: Icon(Icons.account_box),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 6'),
                        subtitle: Text('Description 6'),
                        leading: Icon(Icons.account_circle),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 7'),
                        subtitle: Text('Description 7'),
                        leading: Icon(Icons.account_tree),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 8'),
                        subtitle: Text('Description 8'),
                        leading: Icon(Icons.add),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 9'),
                        subtitle: Text('Description 9'),
                        leading: Icon(Icons.add_a_photo),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 10'),
                        subtitle: Text('Description 10'),
                        leading: Icon(Icons.add_alarm),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
                        title: Text('Item 11'),
                        subtitle: Text('Description 11'),
                        leading: Icon(Icons.add_alert),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      const ListTile(
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

class TopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.snowing),
              Text('Snowing'),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Icon(Icons.currency_bitcoin),
              Text('Bitcoin'),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Icon(Icons.currency_franc_outlined),
              Text('Franc'),
            ],
          ),
        ],
      ),
    );
  }
}
