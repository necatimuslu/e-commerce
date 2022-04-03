import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';
import 'package:twitterapp/main.dart';
import 'package:twitterapp/pages/screens/auth/login_screen.dart';
//import 'package:http/http.dart' as http;
import 'package:twitterapp/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullNameText;
  late TextEditingController userNameText;
  late TextEditingController emailText;
  late TextEditingController passwordText;

  @override
  void initState() {
    super.initState();
    fullNameText = TextEditingController();
    userNameText = TextEditingController();
    emailText = TextEditingController();
    passwordText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameText.dispose();
    userNameText.dispose();
    emailText.dispose();
    passwordText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainWhiteColor,
        appBar: AppBar(
          backgroundColor: mainWhiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: mainLightBlue,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 4,
            ),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: mainLightBlue,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Hesabını Oluştur',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: fullNameText,
                        decoration: const InputDecoration(
                          hintText: 'Ad Soyad giriniz',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: userNameText,
                        decoration: const InputDecoration(
                          hintText: 'Kullanıcı adı giriniz',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailText,
                        decoration: const InputDecoration(
                          hintText: 'Email giriniz',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordText,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Şifre giriniz',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 18,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              registerUser();
                            } else {
                              null;
                            }
                          },
                          child: const Text('Kayıt ol',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabınız var mı?',
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
                        'Giriş',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /* Eski tasarım SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 50,
                    top: MediaQuery.of(context).size.height / 25),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    width: 0.1,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hesabını oluştur',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Ad Soyad giriniz',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Kullanıcı adı giriniz',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email giriniz',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Şifre giriniz',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.1,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 18,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          onPressed: () {},
                          child: const Text('Kayıt ol',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Hesabınız var mı?',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Giriş',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowCircleRight,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ), */
      ),
    );
  }

  Future registerUser() async {
/* Map<String, dynamic> data = {
                                "fullname": fullNameText.text,
                                "username": userNameText.text,
                                "email": emailText.text,
                                "password": passwordText.text
                              }; */
    var dio = Dio();
    var response = await dio.post(registerUrl, data: {
      "fullname": fullNameText.text,
      "username": userNameText.text,
      "email": emailText.text,
      "password": passwordText.text
    });

    final token = response.data['token'];
    prefs.setString('auth', token);
    /* final box = GetStorage();
    box.write('auth', token); */

    // ignore: unnecessary_null_comparison
    if (response != null) {
      Fluttertoast.showToast(
          msg: "Kayıt başarılı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      Future.delayed(const Duration(seconds: 2), () {
        /*    Get.offNamed(Routes.homeScreen); */
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const NavigationControlPage()));
      });
    }
  }
}
