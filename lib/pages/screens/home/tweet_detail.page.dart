import 'package:flutter/material.dart';
import 'package:twitterapp/models/tweet_model.dart';
import 'package:twitterapp/utils/constants.dart';

// ignore: must_be_immutable
class TweetDetailPage extends StatefulWidget {
  TweetModel tweet;
  TweetDetailPage({Key? key, required this.tweet}) : super(key: key);

  @override
  State<TweetDetailPage> createState() => _TweetDetailPageState();
}

class _TweetDetailPageState extends State<TweetDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainLightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.tweet.image!),
                    ),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(widget.tweet.description!),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(widget.tweet.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
