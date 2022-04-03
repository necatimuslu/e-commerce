import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/models/tweet_model.dart';
import 'package:twitterapp/pages/screens/home/create_tweet_screen.dart';
import 'package:twitterapp/pages/screens/home/friend_profile_screen.dart';
import 'package:twitterapp/pages/screens/home/tweet_detail.page.dart';
import 'package:twitterapp/services/tweet_service.dart';
import 'package:twitterapp/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TweetService _tweets = TweetService();

  @override
  void initState() {
    super.initState();

    /*   _tweets.fetchTweet(); */
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset(
                'assets/img/person.png',
                fit: BoxFit.cover,
                height: 50,
                width: 100,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const FaIcon(
                FontAwesomeIcons.twitter,
                color: mainLightBlue,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.star,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<List<TweetModel>>(
          future: _tweets.fetchTweet(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            // ignore: prefer_null_aware_operators
            var reversData = data != null ? data.reversed.toList() : null;
            List<TweetModel> tweets = [];
            if (data != null) {
              tweets.addAll(reversData!);

              return ListView.builder(
                  reverse: true,
                  itemCount: tweets.length,
                  itemBuilder: (context, index) {
                    return TweetCard(
                        tweets[index].description!,
                        tweets[index].image!,
                        tweets[index].userId!,
                        tweets[index]);
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: mainDarkBlue,
                ),
              );
            } else {
              return const Text('Hoop hemşerim nereye');
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateTweetScreen()));
          },
          child: const Icon(Icons.home),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TweetCard(
      String description, String image, String userId, TweetModel tweetModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint(userId);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FriendScreen(userId: userId)));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(image),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Necati Muslu',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '@necati',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          '1 gün',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5.5,
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 4.0,
                          top: 4.0,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height /
                                      description.length >
                                  40
                              ? 15
                              : 13,
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: description.length > 40 ? 1 : 6,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TweetDetailPage(
                    tweet: tweetModel,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 6.5,
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 30, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    width: 1,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.comment,
                    size: 20,
                  ),
                  const FaIcon(
                    FontAwesomeIcons.retweet,
                    size: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {});
                      if (tweetModel.likes!.contains(tweetModel.userId)) {
                        tweetModel.likes!.remove(tweetModel.userId);
                      } else {
                        tweetModel.likes!.add(tweetModel.userId!);
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.heart,
                      size: 20,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.shareAlt,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
