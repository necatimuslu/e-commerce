import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';
import 'package:twitterapp/main.dart';
import 'package:twitterapp/pages/screens/welcome_screen.dart';
import 'package:twitterapp/utils/constants.dart';

class LoginPasswordScreen extends StatefulWidget {
  final String email;
  const LoginPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  late TextEditingController passwordText;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passwordText = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 6.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        'Şifreni gir',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 2.0, right: 10),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
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
                    validator: (value) {
                      if (value == null && value!.length < 6) {
                        return 'Şifre alanı zorunlu ve en az 6 karekterden oluşmalıdır';
                      } else {
                        null;
                      }
                    },
                    controller: passwordText,
                    obscureText: true,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye),
                      hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
                      hintText: 'Şifre',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.71,
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
                        color: passwordText.text == ''
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
                              loginUser();
                            }
                          },
                          child: const Text(
                            'Giriş yap',
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

  Future loginUser() async {
    var dio = Dio();

    var response = await dio.post(loginUrl,
        data: {"email": widget.email, "password": passwordText.text});
    final token = response.data['token'];
    prefs.setString('auth', token);
    /* final box = GetStorage();
    box.write('auth', token); */
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Giriş başarılı",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Future.delayed(const Duration(seconds: 2), () {
        /*  Get.offNamed(Routes.homeScreen); */
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const NavigationControlPage()));
      });
    }
  }
}
