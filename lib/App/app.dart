import 'package:flutter/material.dart';
import 'package:omnispace/App/Features/News/Pages/news_lists.dart';

class OmniSpace extends StatefulWidget {
  const OmniSpace({super.key});

  @override
  State<OmniSpace> createState() => _OmniSpaceState();
}

class _OmniSpaceState extends State<OmniSpace> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NewsLists(),
      ),
    );
  }
}
