import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/pages/screens/auth/login_password_screen.dart';
import 'package:twitterapp/pages/screens/welcome_screen.dart';
import 'package:twitterapp/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailText;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhiteColor,
        appBar: AppBar(
          backgroundColor: mainWhiteColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomeScreen(),
              ),
            ),
            child: const Icon(
              Icons.close,
              color: mainLightBlue,
              size: 25,
            ),
          ),
          title: Container(
            margin: const EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: mainLightBlue,
                  size: 25,
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        'Başlamak için',
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextWidget(
                        'ilk önce telefon',
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextWidget(
                        'numaranı,e-posta',
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextWidget(
                        'adresini veya',
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextWidget(
                        '@kullanıcıadını gir',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: emailText,
                    validator: (value) {
                      if (value == null) {
                        return 'Email girilmesi zorunludur';
                      } else {
                        null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
                      hintText:
                          'Telefon numarası,e-posta veya kullanıcı adı giriniz',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 36,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Şifreni mi unuttun?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      height: 36,
                      width: MediaQuery.of(context).size.width / 5.5,
                      decoration: BoxDecoration(
                        // ignore: unnecessary_null_comparison
                        color: emailText.text == ''
                            ? Colors.grey.withOpacity(0.8)
                            : Colors.black,
                        border: Border.all(
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPasswordScreen(
                                          email: emailText.text)));
                            }
                          },
                          child: const Text(
                            'ileri',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainWhiteColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TextWidget(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
