import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/home.dart';

class APIs {
  static const String BASE_URL = 'http://111.231.243.232/';

  static Future<Home> getHome() async {
    const String topicsUrl = '$BASE_URL/topics';
    const String sectionsUrl = '$BASE_URL/videos';
    Dio dio = new Dio();

    List<Response> responseDatas = 
      await Future.wait([dio.get(topicsUrl), dio.get(sectionsUrl)]);

    Map topics = json.decode(responseDatas.first.data);
    Map sections = json.decode(responseDatas.last.data);

    Home home = Home();
    home.sections = (sections as List)
      .map((v) => VideoSection.fromJson(v))
      .toList();
    home.topics = (topics as List).map((v) => Topic.fromJson(v)).toList();

    return home;
  }
}