import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/models/tweet_model.dart';

class TweetService {
  Future<List<TweetModel>> fetchTweet() async {
    List<TweetModel> listTweet = [];
    try {
      var dio = Dio();
      var response = await dio.get('http://192.168.1.103:50100/tweet/all');

      if (response.statusCode == 200) {
        for (Map<String, dynamic> tweet in response.data) {
          listTweet.add(TweetModel.fromJson(tweet));
        }
      }

      return listTweet;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
