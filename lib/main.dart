import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitterapp/controls/navigation_control_page.dart';
import 'package:twitterapp/pages/screens/welcome_screen.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*  await GetStorage.init(); */
  prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('auth');

  Widget _screen;
  if (token == null || token == '') {
    _screen = const WelcomeScreen();
  } else {
    _screen = const NavigationControlPage();
  }

  runApp(MyApp(
    screen: _screen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screen,
      /*  initialRoute: AppRoutes.initialPage,
      getPages: AppRoutes.routes, */
    );
  }
}
