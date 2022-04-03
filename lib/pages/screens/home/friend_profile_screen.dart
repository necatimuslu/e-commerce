import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';

import 'package:twitterapp/models/tweet_userid_model.dart';
import 'package:twitterapp/services/auth_service.dart';

import 'package:twitterapp/utils/constants.dart';

class FriendScreen extends StatefulWidget {
  final String userId;
  const FriendScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6.5,
                decoration: const BoxDecoration(
                  color: mainLightBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationControlPage(),
                          ),
                        ),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: mainWhiteColor,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(
                            Icons.logout_outlined,
                            color: mainWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: FutureBuilder<List<TweetUserIdModel>>(
                    future: fetchTweetUserById(widget.userId),
                    builder: (context, snapshot) {
                      var data = snapshot.data;
                      if (data != null) {
                        List<TweetUserIdModel> tweetsId = [];
                        tweetsId.addAll(snapshot.data!);
                        return ListView.builder(
                            reverse: true,
                            itemCount: tweetsId.length,
                            itemBuilder: (context, index) {
                              return TweetCard(tweetsId[index].description!,
                                  tweetsId[index].image!);
                            });
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: mainDarkBlue,
                          ),
                        );
                      } else {
                        return const Text('Hoop hemşerim nereye');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TweetCard(String description, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(image),
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
          Container(
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
                  const FaIcon(
                    FontAwesomeIcons.heart,
                    size: 20,
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
