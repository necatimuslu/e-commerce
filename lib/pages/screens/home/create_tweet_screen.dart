import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';
import 'package:twitterapp/main.dart';

import 'package:twitterapp/utils/constants.dart';

class CreateTweetScreen extends StatefulWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);

  @override
  State<CreateTweetScreen> createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  late TextEditingController _tweetText;
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickerImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickerImage != null) {
        image = File(pickerImage.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tweetText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tweetText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteColor,
      appBar: AppBar(
        backgroundColor: mainWhiteColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InkWell(
              onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationControlPage(),
                    ),
                  ),
              child: const Icon(Icons.close, color: Colors.black)),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(
              top: 18,
              right: 12,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mainLightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () async {
                var dio = Dio();
                var header = {"Authorization": "Bearer ${prefs.get('auth')}"};
                var response = await dio.post(createTweetUrl,
                    data: await addTweet(_tweetText.text, image!),
                    options: Options(headers: header));

                if (response.statusCode == 201 || response.statusCode == 200) {
                  debugPrint('Eklendi');
                }
              },
              child: const Text(
                'Tweetle',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 8,
                      width: MediaQuery.of(context).size.height / 18,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/img/person.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 5,
                      child: TextField(
                        controller: _tweetText,
                        maxLines: 7,
                        decoration: const InputDecoration(
                          hintText: 'Neler oluyor?',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Resim seçiniz'),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        getImage();
                      },
                      child: const Icon(
                        Icons.image,
                        size: 40,
                      ),
                    )
                  ],
                ),
                // ignore: unnecessary_null_comparison
                image == null
                    ? Container()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Image.file(image!),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<FormData> addTweet(String description, File image) async {
    var formData = FormData();
    formData.files
        .add(MapEntry('description', MultipartFile.fromString(description)));
    formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(
          image.path,
        )));
    return formData;
  }
}
