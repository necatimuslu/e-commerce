import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';
import 'package:twitterapp/main.dart';
import 'package:twitterapp/models/tweet_model.dart';
import 'package:twitterapp/models/user_model.dart';
import 'package:twitterapp/pages/screens/welcome_screen.dart';
import 'package:twitterapp/services/auth_service.dart';
import 'package:twitterapp/services/tweet_service.dart';

import 'package:twitterapp/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhiteColor,
        /*  appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 6.9,
          backgroundColor: mainLightBlue,
          leading: const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 8),
            child: InkWell(
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: mainWhiteColor,
                  ),
                ),
              ),
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0, right: 12),
              child: InkWell(
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      color: mainWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ), */
        body: SingleChildScrollView(
          child: FutureBuilder<UserModel?>(
            future: getUserById(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                UserModel data = snapshot.data!;
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 6.5,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data.banner!),
                                  ),
                                  color: mainLightBlue),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 8),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavigationControlPage()));
                                      },
                                      child: const Align(
                                        alignment: Alignment.topLeft,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black38,
                                          child: Icon(
                                            Icons.keyboard_backspace,
                                            color: mainWhiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12.0, right: 12),
                                    child: InkWell(
                                      onTap: () async {
                                        await prefs.remove('auth');
                                        Future.delayed(
                                            const Duration(seconds: 1), () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WelcomeScreen()));
                                        });
                                      },
                                      child: const Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.black38,
                                          child: Icon(
                                            Icons.logout,
                                            color: mainWhiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                16,
                                        top:
                                            MediaQuery.of(context).size.height /
                                                18),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                          4.5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 3,
                                          color: mainWhiteColor,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(data.image!),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height /
                                                8,
                                        right: 10,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        border: Border.all(
                                          width: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: TextButton(
                                        child: const Text(
                                          'Profili Düzenle',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.username!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                '@${data.email!}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.birthdayCake,
                                size: 22,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Doğum tarihi :',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '05 Ağustos 1994',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.event_note,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Ekim 2020',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'tarihinde katıldı',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: const [
                                Text(
                                  'Tweetler',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Tweetler ve yanıtlar',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Medya',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Beğeniler',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: FutureBuilder<List<TweetModel>>(
                            future: TweetService().fetchTweet(),
                            builder: (context, snapshot) {
                              var data = snapshot.data;
                              // ignore: prefer_null_aware_operators

                              List<TweetModel> tweets = [];
                              if (data != null) {
                                tweets.addAll(data);

                                return ListView.builder(
                                    reverse: true,
                                    itemCount: tweets.length,
                                    itemBuilder: (context, index) {
                                      return TweetCard(
                                          tweets[index].description!,
                                          tweets[index].image!);
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
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: mainDarkBlue,
                  ),
                );
              } else {
                return const Center(
                  child: Text('Hooop hemşerim nereye'),
                );
              }
            },
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
