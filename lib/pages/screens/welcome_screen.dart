import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/pages/screens/auth/login_screen.dart';
import 'package:twitterapp/pages/screens/auth/register_screen.dart';

import 'package:twitterapp/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhiteColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(
                FontAwesomeIcons.twitter,
                color: mainLightBlue,
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: mainWhiteColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 3,
                child: const Text(
                  'Şu anda dünyada olup bitenleri gör.',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 19,
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 0.2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Google ile devam et',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('veya'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 1,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 19,
              width: MediaQuery.of(context).size.width / 1.4,
              decoration: BoxDecoration(
                color: mainLightBlue,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        'Hesap Oluştur',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: mainWhiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  'Kaydolarak',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const InkWell(
                  child: Text(
                    'Hizmet Şartlarımızı',
                    style: TextStyle(
                      fontSize: 12,
                      color: mainLightBlue,
                    ),
                  ),
                ),
                const Text(','),
                const SizedBox(
                  width: 3,
                ),
                const InkWell(
                  child: Text(
                    'Gizlilik Politikalarımızı',
                    style: TextStyle(
                      fontSize: 12,
                      color: mainLightBlue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  've',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                GestureDetector(
                  child: const Text(
                    'Çerez Kullanım Politikamızı',
                    style: TextStyle(
                      fontSize: 12,
                      color: mainLightBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  'kabul etmiş olursun.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Zaten bir hesabın var mı?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    'Giriş yap',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
