import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:twitterapp/main.dart';
import 'package:twitterapp/models/tweet_userid_model.dart';

import 'package:twitterapp/models/user_model.dart';
import 'package:twitterapp/utils/constants.dart';

Future<UserModel?> getUserById() async {
  var header = {"Authorization": "Bearer " + prefs.get('auth').toString()};
  var dio = Dio();
  var response =
      await dio.get(getUserByIdUrl, options: Options(headers: header));

  if (response.statusCode == 200) {
    return UserModel.fromJson(response.data);
  }
  return null;
}

Future<List<TweetUserIdModel>> fetchTweetUserById(String id) async {
  List<TweetUserIdModel> listTweet = [];
  try {
    var dio = Dio();
    var response = await dio.post(getTweetUserByIdUrl, data: {"userId": id});

    if (response.statusCode == 200) {
      for (Map<String, dynamic> tweet in response.data) {
        listTweet.add(TweetUserIdModel.fromJson(tweet));
      }
    }

    return listTweet;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}
