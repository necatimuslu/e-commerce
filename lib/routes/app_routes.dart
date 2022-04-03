import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:twitterapp/pages/screens/auth/login_screen.dart';
import 'package:twitterapp/pages/screens/auth/register_screen.dart';
import 'package:twitterapp/pages/screens/home/home_screen.dart';
import 'package:twitterapp/pages/screens/welcome_screen.dart';

class AppRoutes {
  static final initialPage = GetStorage().read<bool>('auth') == true
      ? Routes.homeScreen
      : Routes.welcomeScreen;
  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: Routes.homeScreen, page: () => const HomeScreen()),
    GetPage(name: Routes.registerScreen, page: () => const RegisterScreen()),
    GetPage(name: Routes.loginScreen, page: () => const LoginScreen()),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const homeScreen = '/homeScreen';
  static const registerScreen = '/registerScreen';
  static const loginScreen = '/loginScreen';
}
