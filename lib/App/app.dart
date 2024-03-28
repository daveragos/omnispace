import 'package:flutter/material.dart';
import 'package:omnispace/App/Features/News/Pages/news_lists.dart';
import 'package:geolocator/geolocator.dart';
import 'package:omnispace/App/Service/location/location.dart';

class OmniSpace extends StatefulWidget {
  const OmniSpace({super.key});

  @override
  State<OmniSpace> createState() => _OmniSpaceState();
}

class _OmniSpaceState extends State<OmniSpace> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

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
