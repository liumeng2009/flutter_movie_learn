import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../models/home.dart';

class APIs {
  static const String BASE_URL = 'http://111.231.243.232/';

  static Future<Home> getHome() async {
    Dio dio = createDio();

    List<Response> responseDatas = 
      await Future.wait([dio.get('topics'), dio.get('videos')]);

    Map topics = json.decode(responseDatas.first.data);
    Map sections = json.decode(responseDatas.last.data);

    Home home = Home();
    home.sections = (sections['data'] as List)
      .map((v) => VideoSection.fromJson(v))
      .toList();
    home.topics = (topics['data'] as List).map((v) => Topic.fromJson(v)).toList();

    return home;
  }

  static Future<List<Topic>> getTopics() async {
    Dio dio = createDio();

    var response = await dio.get('topics');
    Map map = json.decode(response.data);

    List<Topic> topics = (map['data'] as List).map((v) => Topic.fromJson(v)).toList();
    return topics;
  }

  static Dio createDio({String baseUrl = 'http://111.231.243.232/', } ) {
    Dio dio = new Dio(
      new BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 100000,
        // 5s
        headers: {
          HttpHeaders.userAgentHeader: "dio",
          "api": "1.0.0",
        },
        contentType: ContentType.json,
        // Transform the response data to a String encoded with UTF8.
        // The default value is [ResponseType.JSON].
        responseType: ResponseType.plain,
      )
    );
    return dio;
  }
}