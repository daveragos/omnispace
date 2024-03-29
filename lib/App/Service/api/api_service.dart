import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omnispace/App/Features/News/Model/news_model.dart';
import 'package:omnispace/App/Service/api/api.dart';
import 'package:omnispace/App/Service/api/api_constants.dart';

class ApiGets {
  final API api = API();
  Future<List<News?>> getNews(
      {required String route, required BuildContext context}) async {
    List<News?> result;
    final baseUrl = APIConst.newsbaseurl;
    try {
      Response response =
          await api.getRequest(route: baseUrl + route, context: context);
      if (response.data.isEmpty) {
        result = [];
      } else {
        print('RESPONSE ============= ${response}');
        result =
            (response.data as List).map((post) => News.fromJson(post)).toList();
        print(result);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response);
      } else {
        throw Exception(e.message);
      }
    }
    return result;
  }

  Future<Response> getWeather(
      {required String route, required BuildContext context}) async {
    final baseUrl = APIConst.weatherbaseurl;
    Response response =
        await api.getRequest(route: baseUrl + route, context: context);
    return response;
  }
}
